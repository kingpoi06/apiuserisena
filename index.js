import express from "express"
import db from "./config/Database.js"
import cors from "cors";
import session from "express-session";
import dotenv from  "dotenv";
import cookieParser from "cookie-parser"
import SequelizeStore from "connect-session-sequelize";
import UserRoute from "./routes/UserRoute.js";
import PasienRoute from "./routes/PasienRoute.js";
import PFRoute from "./routes/PFRoute.js";
import AuthRoute from "./routes/AuthRoute.js";
import AuthPasienRoute from "./routes/AuthPasienRoute.js"
// import Users from "./models/UsersModel"
// import Pasiens from "./models/PasiensModel"
// import PFs from "./models/PFModel"

dotenv.config();
const app = express();

const sessionStore = SequelizeStore(session.Store);

const store = new sessionStore({
    db: db
});

app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
        secure: 'auto'
    }
}));

// (async()=>{
//     await db.sync();
// })();

// try{
//     await db.authenticate();
//     console.log("Database Connected...!")
//     await Users.sync();
// } catch (error){
//     console.error(error);
// }
app.use(cors({
    credentials: true,
    origin: '*', 
    // origin: 'https://feuserisena.vercel.app',
}))

app.use(express.json());
app.use(cookieParser());
app.use(UserRoute);
app.use(PasienRoute);
app.use(PFRoute);
app.use(AuthRoute);
app.use(AuthPasienRoute);
// app.use(AuthRoute);
// app.use(AddPasienRoute);

// store.sync();


app.listen(process.env.APP_PORT, ()=> {
    console.log('Server up and running...');
})