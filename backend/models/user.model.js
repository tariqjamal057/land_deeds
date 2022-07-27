const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const User = Schema({
  username: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  firstname: {
    type: String,
  },
  lastname: {
    type: String,
  },
  phonenumber: {
    type: Number,
    min: 10,
    max: 10,
  },
  photo: {
    type: String,
  },
  dob: {
    type: Date,
    default: Date.now,
  },
  country: {
    type: String,
  },
  state: {
    type: String,
  },
  city: {
    type: String,
  },
  address: {
    type: String,
  },
  no_of_lands: {
    type: Number,
  },
  land_seeled: {
    type: Number,
  },
  lastlogintime: {
    type: Date,
  },
  isverified: {
    type: Boolean,
  },
});

module.exports = mongoose.model("User", User);
