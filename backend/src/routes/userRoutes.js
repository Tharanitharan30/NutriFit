const express = require("express");
const router = express.Router();

const verifyToken =
require("../middleware/authMiddleware");

const {
  updateProfile,
  getProfile
} = require("../controllers/userController");

router.put(
  "/profile",
  verifyToken,
  updateProfile
);

router.get(
  "/profile",
  verifyToken,
  getProfile
);

module.exports = router;