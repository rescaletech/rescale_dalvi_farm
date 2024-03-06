const express = require("express");
const admin = require("../middlewares/admin.js");
const { Product } = require("../models/product.js");
const adminRouter = express.Router();
// Creating an Admin Middleware
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;

        let product = new Product({
            name,
            description,
            images,
            price,
            quantity,
            category,
        });

        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
adminRouter.get("/admin/get-products", admin, async (req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
    } catch (error) {
        res.status(500).json({ error: e.message });
    }
});

// delete the product

adminRouter.post("/admin/delete-product", admin, async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.send("All went well!");
    } catch (error) {
        res.status(500).json({ error: e.message });
    }
}
)

module.exports = adminRouter;
