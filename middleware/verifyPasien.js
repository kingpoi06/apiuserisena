import Pasiens from "../models/PasienModel.js";

export const verifyPasien = async (req, res, next) => {
    try {
        if (!req.session.pasienId) {
            return res.status(401).json({ msg: "Mohon Masukan Data Pasien" });
        }
        
        const pasien = await Pasiens.findOne({
            where: {
                uuid: req.session.pasienId
            }
        });

        if (!pasien) {
            return res.status(404).json({ msg: "Pasien tidak ada!" });
        }
        
        // Memasukkan pasienId dan nobpjs ke dalam req untuk digunakan di middleware selanjutnya
        req.pasienId = pasien.id;
        req.role = pasien.role; 
        next();
    } catch (error) {
        // Mengembalikan pesan error jika terjadi kesalahan saat mencari pasien
        return res.status(500).json({ msg: error.message });
    }
};

export const nobpjsOnly = async (req, res, next) => {
    try {
        // Mencari pasien berdasarkan uuid dari sesi
        const pasien = await Pasiens.findOne({
            where: {
                uuid: req.session.pasienId
            }
        });
        if (!pasien) {
            return res.status(404).json({ msg: "Pasien not found" });
        }
        if (pasien.role !== "pasien") {
            return res.status(403).json({ msg: "Access X" });
        }

        next(); 
    } catch (error) {
        // Mengembalikan pesan error jika terjadi kesalahan
        res.status(500).json({ msg: error.message });
    }
};