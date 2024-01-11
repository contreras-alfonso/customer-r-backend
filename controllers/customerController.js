import bcrypt from "bcrypt";
import Customer from "../models/customerModel.js";
import { Op } from "sequelize";

const addCustomer = async (req, res) => {
  const {
    dni,
    names,
    lastnames,
    birthdate,
    phone,
    email,
    bank,
    accountNumber,
    password,
  } = req.body;
  console.log(req.body) 
  if (
    [
      dni,
      names,
      lastnames,
      birthdate,
      phone,
      email,
      bank,
      accountNumber,
      password,
    ].includes("")
  )
    return res.json({
      status: false,
      msg: "All fields are required.",
    });

  try {
    const search_dni = await Customer.findOne({ where: { dni } });
    if (search_dni)
      return res.json({ status: false, msg: "Error, DNI already in use." });
    const search_email = await Customer.findOne({ where: { email } });
    if (search_email)
      return res.json({ status: false, msg: "Error, email already in use." });
  } catch (error) {
    res.json({ status: false, msg: "Server error." });
  }

  const customer = new Customer({
    dni,
    names,
    last_names:lastnames,
    birthdate,
    phone,
    email,
    bank,
    cci_number:accountNumber,
    bonus_password: await bcrypt.hash(password,10),
  });

  try {
    console.log(customer)
    await customer.save();
    res.json({ status: true, msg: "Customer successfully added.", customer });
  } catch (error) {
    console.log(error)
    res.json({ status: false, msg: "Server error." });
  }
};

const getAllCustomers = async (req, res) => {
  try {
    const { page } = req.params;
    const pageSize = 10;

    const customers = await Customer.findAll({
      attributes: { exclude: ["bonus_password"] },
      order: [["id", "DESC"]],
      limit: pageSize,
      offset: (page - 1) * pageSize,
    });

    res.json({ status: true, customers });
  } catch (error) {
    res.json({ status: false, msg: "Server error." });
  }
};

const getCustomer = async (req, res) => {
  try {
    const { dniOrName } = req.params;

    const customers = await Customer.findAll({
      attributes: { exclude: ["bonus_password"] },
      where: {
        [Op.or]: [
          { dni: { [Op.like]: `%${dniOrName}%` } },
          { names: { [Op.like]: `%${dniOrName}%` } },
        ],
      },
    });

    if (!customers || customers.length === 0) {
      return res.json({ status: false, msg: "No customers found.", customers: [] });
    }

    res.json({ status: true, customers });
  } catch (error) {
    console.error(error);
    res.json({ status: false, msg: "Server error." });
  }
};

const loginCustomer = async (req, res) => {
  const { email, password } = req.body;

  if ([email, password].includes(""))
    return res.json({ status: false, msg: "All fields are required." });

  try {
    const customer_email = await Customer.findOne({ where: { email } });

    if (!customer_email)
      return res.json({ status: false, msg: "Incorrect email or password." });

    const isValidPassword = await bcrypt.compare(
      password,
      customer_email.bonus_password
    );

    if (!isValidPassword)
      return res.json({ status: false, msg: "Incorrect email or password." });

    return res.json({ status: true, msg: "Successful login, welcome. :)" });
  } catch (error) {
    res.json({ status: false, msg: "Server error." });
  }
};

export { addCustomer, getAllCustomers, getCustomer, loginCustomer };
