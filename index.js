import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import db from './config/db.js'
import customerRoutes from './routes/customerRoutes.js'

const app = express()

app.use(express.json())

dotenv.config()

try {
    await db.authenticate();
    db.sync();
} catch (error) {
    console.log(error);
}

const corsOptions = {
    origin: "*"
} 

app.use(cors(corsOptions))

app.use('/api/customer',customerRoutes);

app.listen(process.env.PORT,()=>{
    console.log(`Proyect.. port ${process.env.PORT}`)
})