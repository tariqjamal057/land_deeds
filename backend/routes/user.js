const express = require("express");
const User = require("../models/user.model");
const config = require("../config/user.config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware/user.middleware");

const router = express.Router();

router.route("/:username").get(middleware.checkToken,(req,res)=> {
    console.log("Inside user");
    User.findOne(
        {username: req.params.username},
        (err,result)=> {
            if(err) {
                res.status(500).json({msg:err});
            }
            res.json({
                data: result,
                username: req.params.username,
            });
        }
    );
});

router.route("/checkusername/:username").get((req,res)=> {
    User.findOne({username: req.params.username},(err,result)=>{
        if(err) {
            return res.status(500).json({msg:err});
        }
        if(result !== null) {
            return res.json({
                Status: true,
            });
        }
        else {
            return res.json({
                Status: false
            });
        }
    });
});


router.route("/login").post((req,res)=> {
    console.log("Inside Login");
    User.findOne(
        {username: req.body.username},
        (err,result)=> {
            if(err) {
                return res.status(500).json({msg:err});
            }
            if(result === null) {
                console.log(result);
                return res.status(403).json("User  Not Found");
                
            }
            if(result.password === req.body.password) {
                let token = jwt.sign(
                    { username: req.body.username },
                    config.key,{
                        expiresIn: "24h", // token expiration
                    }
                );
                console.log(token);
                res.json({
                    token:token,
                    "msg":"Login Success",
                });
            }
            else {
                res.status(403).json("Password Incorrect");
            }
        }
    );
})

router.route("/register").post((req,res)=>{
    console.log("Inside Register");
    const user = new User({
        username: req.body.username,
        password: req.body.password,
        email: req.body.email,
    });
    user
        .save()
        .then(()=> {
            console.log("user regitered");
            res.status(200).json("ok");
        })
        .catch((err)=> {
            res.status(403).json({msg:err});
        });
});

router.route("/update_password/:username").patch((req,res) => {
    User.findOneAndUpdate(
        { username: req.params.username },
        { $set: {
            password: req.body.password
        } },
        (err,result)=> {
            if(err) {
                return res.status(500).json({msg:err});
            }
            const msg = {
                msg: "Password Updated Successfully",
                username: req.params.username,
            };
            return res.json(msg);
        }
    );
});


router.route("/update/:username").patch((req,res) => {
    User.findOneAndUpdate(
        { username: req.params.username },
        { $set: {
            firstname: req.body.firstname,
            lastname: req.body.lastname,
            phonenumber: req.body.phonenumber,
            dob: req.body.dob,
            country: req.body.country,
            state: req.body.state,
            city: req.body.city,
            address: req.body.address,
        } },
        (err,result)=> {
            if(err) {
                return res.status(500).json({msg:err});
            }
            const msg = {
                msg: "User Details Updated Successfully Updated Successfully",
                username: req.params.username,
            };
            return res.json(msg);
        }
    );
});


router.route("/delete/:username").delete((req,res)=> {
    console.log("deletnxcb")
    User.findOneAndDelete({ username: req.params.username },
        (err,result)=> {
            if(err) {
                return res.status(500).json({ msg:err });
            }
            const msg = {
                msg: "User Deleted",
                username: req.params.username,
            };
            return res.json(msg);
        }
    );
});

module.exports = router;