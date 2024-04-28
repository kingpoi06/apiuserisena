import Pasiens from "../models/PasienModel.js";

export const LoginPasien = async (req, res) => {
    const pasien = await Pasiens.findOne({
        where: {
            nobpjs: req.body.nobpjs
        }
    });
    if(!pasien) return res.status(404).json({msg: "No BPJS Tidak Terdaftar!"});
    req.session.pasienId = pasien.uuid;
    const uuid = pasien.uuid;
    const nama = pasien.nama;
    const tgllahir = pasien.tgllahir;
    const umur = pasien.umur;
    const alamat = pasien.alamat;
    const norm = pasien.norm;
    const nobpjs = pasien.nobpjs;
    res.status(200).json({uuid, nama, tgllahir, umur, alamat, norm, nobpjs});
}