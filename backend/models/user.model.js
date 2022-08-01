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
  },
  photo: {
    type: String,
  },
  dob: {
    type: Date,
    default: Date.now,
  },
  gender: {
    type: String,
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
    default: 0,
  },
  land_seeled: {
    type: Number,
    default: 0,
  },
  land_buyed: {
    type: Number,
    default: 0,
  },
  lastlogintime: {
    type: Date,
  },
  isverified: {
    type: Boolean,
    default: false
  },
  isUpdated: {
    type: Boolean,
    default: false
  }
});

module.exports = mongoose.model("User", User);
