import Users from "../models/UserModel.js"
import jwt from "jsonwebtoken"
import argon2 from "argon2"

export const postLogin = async(req, res) => {
    try {
        const user = await Users.findOne({
            where: {
                username: req.body.username
            }
        });

        if (!user) {
            return res.status(404).json({ msg: "Akun tidak terdaftar" });
        }

        const match = await argon2.verify(user.password, req.body.password);
        if (!match) {
            return res.status(400).json({ msg: 'Password Salah. Silahkan Masukan Lagi!' });
        }

        req.session.userId = user.uuid;

        const { uuid, username, email, role } = user;

        const accessToken = jwt.sign({ uuid, username, email, role }, process.env.ACCESS_TOKEN_SECRET, {
            expiresIn: '20s'
        });

        const refreshToken = jwt.sign({ uuid, username, email, role }, process.env.REFRESH_TOKEN_SECRET, {
            expiresIn: '1d'
        });

        await Users.update({ jwt_token: refreshToken }, {
            where: {
                id: user.id
            }
        });

        res.cookie('refreshToken', refreshToken, {
            httpOnly: false,
            maxAge: 24 * 60 * 60 * 1000,
            secure: true
        });
        res.json({ accessToken });
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: "Terjadi kesalahan pada server" });
    }
}

export const deleteLogout = async (req, res) => {
    try {
        const refreshToken = req.cookies.refreshToken;
        if (!refreshToken) return res.sendStatus(204);
        
        const user = await Users.findOne({
            where: {
                jwt_token: refreshToken
            }
        });
        
        if (!user) return res.sendStatus(404); // Ubah menjadi res.sendStatus(404)

        // Hancurkan sesi bahkan jika token tidak ditemukan
        req.session.destroy();

        const userId = user.id;
        await Users.update({ jwt_token: null }, {
            where: {
                id: userId
            }
        });

        res.clearCookie('refreshToken');
        res.status(200).json({ msg: "Successfully logged out" });
    } catch (error) {
        console.error(error);
        res.sendStatus(500);
    }
};