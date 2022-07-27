const express = require('express')
const mongoose = require('mongoose')

mongoose.connect("mongodb://localhost:27017/land_deeds",{
    useNewUrlParser: true,
})

const connection = mongoose.connection;
connection.once("open", () => {
    console.log("MongoDB Connected");
});

const port = 8000;
const app = express();

// middleware
app.use(express.json())
const userRoute = require("./routes/user");
app.use("/user",userRoute);



app.route("/").get((req,res)=> {
    res.json("hello world");
});

app.listen(port, ()=>{
    console.log("Server Running");
});