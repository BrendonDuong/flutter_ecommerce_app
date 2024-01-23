const mongoose = require("mongoose");
const { productSchema } = require("./product");

const orderSchema = mongoose.Schema({
    products: [
        {
            product: productSchema,
            quantity: {
                required: true,
                type: Number,
            },
        }
    ],
    totalPrice: {
        required: true,
        type: Number,
    },
    address: {
        required: true,
        type: String,
    },
    userId: {
        required: true,
        type: String,
    },
    orderedAt: {
        required: true,
        type: Number,
    },
    status: {
        default: 0,
        type: Number,
    },
});

const Order = mongoose.model("Order", orderSchema);
module.exports = Order;