module.exports = app => {
  const product = require("../controllers/ProductController.js");

  app.get("/products", product.getAll);
  app.post("/check-out", product.checkOut);
};
