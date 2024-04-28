import PFs from "../models/PFModels.js";
import Pasiens from "../models/PasienModel.js";
import Users from "../models/UserModel.js";
import { Op } from "sequelize";
// import argon2 from "argon2";

export const getPFs = async (req, res) => {
    try {
        let response;
        if (req.role === "pasien") {
            response = await PFs.findAll({
                attributes: ['uuid',
                    "unitpelayanan",
                    "keluhanutama", "keluhantambahan", "riwayatpenyakitsekarang",
                    "riwayatpenyakitdahulu", "riwayatpenyakitkeluarga", "riwayatalergi",
                    "terapiyangpernahdijalani", "obatnyangseringdigunakan", "obatyangsedangdikonsumsi",
                    "keadaanumum", "kesadaranGCS", "tekanandarah", "nadi", "suhu", "freknafas",
                    "beratbadan", "tinggibadan", "imtBBTB", "kepala", "thorax", "abdormen", "ekstremitas", "lainnya",
                    "statusmental", "responemosi", "hubunganpasiendengankeluarga", "ketaatanmenjalaniibadah", "bahasa", "createdAt"],
                include: [{
                    model: Pasiens,
                    attributes: ['uuid', 'nama', 'nobpjs'] // tambahkan atribut yang Anda perlukan dari model Pasiens
                }]
            });
        } else {
            response = await PFs.findAll({
                attributes: ['uuid',
                    "unitpelayanan",
                    "keluhanutama", "keluhantambahan", "riwayatpenyakitsekarang",
                    "riwayatpenyakitdahulu", "riwayatpenyakitkeluarga", "riwayatalergi",
                    "terapiyangpernahdijalani", "obatnyangseringdigunakan", "obatyangsedangdikonsumsi",
                    "keadaanumum", "kesadaranGCS", "tekanandarah", "nadi", "suhu", "freknafas",
                    "beratbadan", "tinggibadan", "imtBBTB", "kepala", "thorax", "abdormen", "ekstremitas", "lainnya",
                    "statusmental", "responemosi", "hubunganpasiendengankeluarga", "ketaatanmenjalaniibadah", "bahasa", "createdAt"],
                where: {
                    pasienId: req.pasienId
                },
                include: [{
                    model: Pasiens,
                    attributes: ['uuid', 'nama', 'nobpjs'] // tambahkan atribut yang Anda perlukan dari model Pasiens
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}


export const getPFById = async (req, res) => {
    try {
        const pf = await PFs.findOne({
            where: {
                uuid: req.params.id
            }
        });

        if (!pf) return res.status(404).json({ msg: "Data not found!" });

        let response;
        if (req.role === "pasien") {
            response = await PFs.findOne({
                where: {
                    id: pf.id
                },
                include: [{
                    model: Pasiens,
                    attributes: ['uuid', 'nama', 'nobpjs']
                }]
            });
        } else {
            response = await PFs.findOne({
                where: {
                    [Op.and]: [{ id: pf.id }, { pasienId: req.pasienId }]
                },
                include: [{
                    model: Pasiens,
                    attributes: ['uuid', 'nama', 'nobpjs']
                }]
            });
        }

        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};


export const createPF = async (req, res) => {
    const { unitpelayanan,
        keluhanutama, keluhantambahan, riwayatpenyakitsekarang, 
        riwayatpenyakitdahulu, riwayatpenyakitkeluarga, riwayatalergi, 
        terapiyangpernahdijalani, obatnyangseringdigunakan, obatyangsedangdikonsumsi,
        keadaanumum, kesadaranGCS, tekanandarah, nadi, suhu, freknafas,
        beratbadan, tinggibadan, imtBBTB, kepala, thorax, abdormen, ekstremitas, lainnya,
        statusmental, responemosi, hubunganpasiendengankeluarga, ketaatanmenjalaniibadah, bahasa } = req.body;
    try {
        const pf = await PFs.create({
            unitpelayanan: unitpelayanan,
            // PEMERIKSAAN ANAMNESA
            keluhanutama: keluhanutama, keluhantambahan: keluhantambahan, riwayatpenyakitsekarang: riwayatpenyakitsekarang,
            riwayatpenyakitdahulu: riwayatpenyakitdahulu, riwayatpenyakitkeluarga:  riwayatpenyakitkeluarga,
            riwayatalergi: riwayatalergi, terapiyangpernahdijalani: terapiyangpernahdijalani, obatnyangseringdigunakan: obatnyangseringdigunakan,
            obatyangsedangdikonsumsi: obatyangsedangdikonsumsi,

            // PEMERIKSAAN FISIK
            keadaanumum: keadaanumum,
            kesadaranGCS: kesadaranGCS,
            tekanandarah: tekanandarah,
            nadi: nadi,
            suhu: suhu,
            freknafas: freknafas,

            //antrometri
            beratbadan: beratbadan,
            tinggibadan: tinggibadan,
            imtBBTB: imtBBTB,

            //status generalis
            kepala: kepala,
            thorax: thorax,
            abdormen: abdormen,
            ekstremitas: ekstremitas,
            lainnya: lainnya,

            //sosiokultural & baik
            statusmental: statusmental,
            responemosi: responemosi,
            hubunganpasiendengankeluarga: hubunganpasiendengankeluarga,
            ketaatanmenjalaniibadah: ketaatanmenjalaniibadah,
            bahasa: bahasa,

            pasienId: req.pasienId 
        });

        res.status(201).json({ msg: "Pemeriksaan Fisik Created Successfully", pf });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

export const updatePF = async (req, res) => {
    try {
        const pf = await PFs.findOne({
            where: {
                uuid: req.params.id
            }
        });

        if (!pf) return res.status(404).json({ msg: "Data not found!" });

        // Ambil semua bidang yang diizinkan untuk diupdate
        const allowedFields = [
            "unitpelayanan",
            "keluhanutama",
            "keluhantambahan",
            "riwayatpenyakitsekarang",
            "riwayatpenyakitdahulu",
            "riwayatpenyakitkeluarga",
            "riwayatalergi",
            "terapiyangpernahdijalani",
            "obatnyangseringdigunakan",
            "obatyangsedangdikonsumsi",
            "keadaanumum",
            "kesadaranGCS",
            "tekanandarah",
            "nadi",
            "suhu",
            "freknafas",
            "beratbadan",
            "tinggibadan",
            "imtBBTB",
            "kepala",
            "thorax",
            "abdormen",
            "ekstremitas",
            "lainnya",
            "statusmental",
            "responemosi",
            "hubunganpasiendengankeluarga",
            "ketaatanmenjalaniibadah",
            "bahasa"
        ];

        // Filter bidang yang diperbolehkan untuk diupdate dari req.body
        const updateFields = {};
        Object.keys(req.body).forEach((key) => {
            if (allowedFields.includes(key)) {
                updateFields[key] = req.body[key];
            }
        });

        // Lakukan pembaruan data
        await PFs.update(updateFields, {
            where: {
                uuid: req.params.id
            }
        });

        res.status(200).json({ msg: "Data Pemeriksaan Fisik berhasil diperbaharui!" });
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
};


export const deletePF = async(req, res) =>{
    try {
        const pf = await PFs.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!pf) return res.status(404).json({msg: "Data not found!"});
        const {unitpelayanan,
            keluhanutama, keluhantambahan, riwayatpenyakitsekarang, 
            riwayatpenyakitdahulu, riwayatpenyakitkeluarga, riwayatalergi, 
            terapiyangpernahdijalani, obatnyangseringdigunakan, obatyangsedangdikonsumsi,
            keadaanumum, kesadaranGCS, tekanandarah, nadi, suhu, freknafas,
            beratbadan, tinggibadan, imtBBTB, kepala, thorax, abdormen, ekstremitas, lainnya,
            statusmental, responemosi, hubunganpasiendengankeluarga, ketaatanmenjalaniibadah, bahasa } = req.body;
        if(req.role === "pasien"){
            await PFs.destroy({
                where:{
                    id: pf.id
                }
            });
        }else{
            if(req.pasienId !== pf.pasienId) return res.status(403).json({msg: "Akses terlarang"});
            await PFs.destroy({
                where:{
                    [Op.and]:[{id: pf.id}, {pasienId: req.pasienId}]
                }
            });
        }
        res.status(200).json({msg: "Data Pasien berhasil dihapus!"});
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}