import express from "express";
import {
  addCustomer,
  getAllCustomers,
  getCustomer,
  loginCustomer,
} from "../controllers/customerController.js";

const router = express.Router();

router.post("/add", addCustomer);
router.get("/getAll/:page", getAllCustomers);
//bonus
router.get("/search/:dniOrName", getCustomer);
router.post("/login", loginCustomer);

export default router;
