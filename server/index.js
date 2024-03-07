// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
// IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth.js');
const productRouter = require('./routes/product.js');
const userRouter = require('./routes/user.js');
const adminRouter = require('./routes/admin.js');

//  INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://rajmanbind3535:FuCAVzw1GxtDWSUE@cluster0.g0b73gw.mongodb.net/myDataBase?retryWrites=true&w=majority"

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// connections
mongoose.connect(DB).then(() => {
    console.log('Connection Succesful');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT} `);
});



