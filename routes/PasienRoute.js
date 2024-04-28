import express from "express";
import {
    getPasiens,
    getPasienById,
    createPasien,
    updatePasien,
    deletePasien
} from "../controllers/Pasiens.js";
import { verifyUser } from "../middleware/AuthUser.js";
// import { verifyToken } from "../middleware/verifyToken.js";
// import { verifyPasien, nobpjsOnly } from "../middleware/verifyPasien.js";

const router = express.Router();

router.get('/pasiens',verifyUser, getPasiens);
router.get('/pasiens/:id',verifyUser,  getPasienById);
router.post('/pasiens',verifyUser, createPasien);
router.put('/pasiens/:id',verifyUser, updatePasien);
router.delete('/pasiens/:id',verifyUser, deletePasien);

export default router;