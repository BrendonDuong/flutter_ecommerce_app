// console.log("Hello, World");
// Print('Hello, World');

// Import from Packages
const express = require("express");
const mongoose = require("mongoose");

//imports 'package:express/express.dart'
// Imports from other files
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// Init
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://tuongdvdev:Tuongdvuta2001@cluster0.evdabeh.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
// Client -> middleware -> Server -> Client
//import '.features/auth/screens/auth_screen.dart'

// Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful!');
}).catch((e) => {
    console.log(e);
});

// Creating an API
// http://<youripaddress>/hello-world
// Create a GET Request giving a json response with key of name 
// and value of your name 
// {
// 'name': 'Tuong'
// }

// app.get('/', (req, res) => {
//     res.json({ 'name': 'Tuong' });
// });

// app.get("/hello-world", (req, res) => {
//     res.send("Do It On Your Own.");
// });
//Get, Put, Post, Delete, Update -> CRUD
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});
//Localhost
//