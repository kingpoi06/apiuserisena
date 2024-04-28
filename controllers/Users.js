import User from "../models/UserModel.js";
import argon2 from "argon2";

export const getUsers = async(req, res) =>{
    try {
        const response = await User.findAll({
            attributes:['id','uuid','username','email','role','jwt_token']
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}
export const getUserById = async(req, res) =>{
    try {
        const response = await User.findOne({
            attributes:['id','uuid', 'username', 'email', 'role'],
            where: {
                uuid: req.params.id
            }
        });
        res.status(200).json(response);
    } catch (error){
        res.status(500).json({msg: error.message});
    }
}
export const createUser = async(req, res) =>{
    const {username, email, password, confPassword, role} = req.body;
    if(password !== confPassword) return res.status(400).json({msg: "Password and Confirm Password Don't Match!"});
    const hashPassword = await argon2.hash(password);
    try{
        await User.create({
            username: username,
            email: email,
            password: hashPassword,
            role: role
        });
        res.status(201).json({msg: "Register Done!"});
    } catch(error){
        res.status(400).json({msg: error.message});
    }
}
export const updateUser = async(req, res) =>{
    const user = await User.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if(!user) return res.status(404).json({msg:"User not found"});
    const {username, email, password, confPassword,role} = req.body;
    let hashPassword;
    if(password === "" ||  password == null){
        hashPassword = user.password
    }else{
        hashPassword = await argon2.hast(password);
    }
    if(password !== confPassword) return res.status(400).json({msg: "Password and Confirm Password Don't Match!"});
    try {
        await User.update ({
            username: username,
            email: email,
            password: hashPassword,
            role: role
        },{
            where: {
                id: user.id
            }
        });
        res.status(200).json({msg: "Update Successfully!"});
    }catch (error){
        res.status(400).json({msg: error.message});
    }
}
export const deleteUser = async(req, res) =>{
    const user = await User.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if(!user) return res.status(404).json({msg:"User not found"});
    try {
        await User.destroy ({
            where: {
                id: user.id
            }
        });
        res.status(200).json({msg: "Delete Successfully!"});
    }catch (error){
        res.status(400).json({msg: error.message});
    }
}