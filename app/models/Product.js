const Sequelize = require('sequelize');
const db        = require('./index.js');
const DataTypes = Sequelize;
 
// Define schema
const Product = db.define('products', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING
    },
    sku: {
        type: DataTypes.STRING
    },
    price: {
        type: DataTypes.FLOAT
    },
    inventory_qty: {
        type: DataTypes.FLOAT
    }
});
 
module.exports = Product;
  