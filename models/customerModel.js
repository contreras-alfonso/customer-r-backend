import {DataTypes} from "sequelize";
import db from "../config/db.js";

const Customer = db.define('customers',{
    dni: {
        type: DataTypes.STRING,
        allowNull:false,
    },
    names: {
        type: DataTypes.STRING,
        allowNull:false,
    },
    last_names: {
        type: DataTypes.STRING,
        allowNull:false,
    },
    birthdate:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    phone:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    email:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    bank:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    cci_number:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    bonus_password:{
        type: DataTypes.STRING,
        allowNull:false,
    }

})

export default Customer 