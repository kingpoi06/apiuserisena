import express from "express";
import {
    getPFs,
    getPFById,
    createPF,
    updatePF,
    deletePF
} from "../controllers/PFs.js";
import { verifyPasien, nobpjsOnly } from "../middleware/verifyPasien.js";
// import { verifyToken } from "../middleware/verifyToken.js";
const router = express.Router();

router.get('/pfs',verifyPasien, getPFs);
router.get('/pfs/:id', verifyPasien,  getPFById);
router.post('/pfs', verifyPasien,  createPF);
router.put('/pfs/:id',verifyPasien,   updatePF);
router.delete('/pfs/:id',verifyPasien, deletePF);

export default router;