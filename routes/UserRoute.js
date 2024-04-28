import express from "express";
import {
    getUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser
} from "../controllers/Users.js";
import { verifyUser, adminOnly } from "../middleware/AuthUser.js";
import { verifyToken } from "../middleware/verifyToken.js";


const router = express.Router();

router.get('/users', verifyUser, adminOnly, verifyToken, getUsers);
router.get('/users/:id', verifyUser, adminOnly,  getUserById);
router.post('/users',  createUser);
router.put('/users/:id', verifyUser, adminOnly, updateUser);
router.delete('/users/:id', verifyUser, adminOnly,  deleteUser);

export default router;