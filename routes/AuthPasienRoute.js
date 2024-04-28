import express from "express";
import {
    LoginPasien
    // deleteLogout
} from "../controllers/AuthPasien.js";
// import { refreshToken } from "../controllers/RefreshToken.js";

const router = express.Router();

// router.get('/me', getMe);
router.post('/loginpasien', LoginPasien);
// router.delete('/logout',  deleteLogout);
// router.get('/token', refreshToken);

export default router;