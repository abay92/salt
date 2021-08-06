const Product = require("../models/Product.js")
const Promo = require("../models/Promo.js")
const collect = require('collect.js')

exports.getAll = (req, res) => {
  Product.findAll().then(d => {
    return res.send({
      data: d
    });
  }).catch(err => {
    return res.status(500).send({
      message: err.message || 'Error'
    });
  });
};

exports.checkOut = (req, res) => {
  const collection = collect(req.body.products)
  const allSku = collection.pluck('sku')

  Promo.findAll({raw: true}).then(d => {
    Product.findAll({
      where: { sku: allSku.all() },
      raw: true
    }).then(dd => {
      if (dd.length) {
        var validPromo = []
        const allProduct = collect(dd).transform((item, key) => {
          const qty = collection.firstWhere('sku', item.sku).qty
          item.qty = qty
          item.total = item.price * qty
          item.buy_get = item.price * qty

          var dataPromo = collect(d).where('sku', item.sku).where('min_order', '<=', qty).first()
          if (dataPromo) {
            if (dataPromo.promo_type == 'buy_get') {
              item.buy_get = item.price * (dataPromo.min_order - dataPromo.prize_amount)
            }
            validPromo.push(dataPromo)
          }
          
          return item
        })

        var sub_total = allProduct.sum('total')
        var buy_get = allProduct.sum('buy_get')
        var grand_total = sub_total
        var promo_name = []
        var free = []

        if (validPromo.length) {
          collect(validPromo).map((item, key) => {
            if (item.promo_type == 'gift_item') {
              promo_name.push(item.name)

              free.push(item.promo_type_value)
            } else if (item.promo_type == 'buy_get') {
              promo_name.push(item.name)

              grand_total = buy_get
            } else if (item.promo_type == 'percentage') {
              promo_name.push(item.name)

              var totalPercen = ((parseInt(item.promo_type_value) / 100) * grand_total).toFixed(2)
              grand_total = grand_total - totalPercen
            }
          })
        }

        var returnAll = {
          'products': allProduct.all(),
          'sub_total': sub_total,
          'grand_total': parseFloat(grand_total.toFixed(2)),
          'promo_name': promo_name,
          'free': []
        }

        if (free.length) {
          Product.findAll({
            attributes: ['id', 'sku', 'name'],
            where: { sku: free }
          }).then(f => {
            returnAll.free = f

            return res.send({
              data: returnAll
            })
          })
        } else {
          return res.send({
            data: returnAll
          })
        }
      } else {
        return res.send({
          data: []
        })
      }
    })
  })
};
