const Sequelize = require('sequelize');
const db        = require('./index.js');
const DataTypes = Sequelize;
 
// Define schema
const Promo = db.define('promo_products', {
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
    min_order: {
        type: DataTypes.INTEGER
    },
    promo_type: {
        type: DataTypes.STRING
    },
    promo_type_value: {
        type: DataTypes.STRING
    },
    prize_amount: {
        type: DataTypes.INTEGER
    },
});
 
module.exports = Promo;
  