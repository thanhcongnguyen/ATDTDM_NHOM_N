var express = require('express');
var router = express.Router();
const productController = require('../controllers/products.js');
router.get('/', productController.list);
router.post('/create', productController.save);
router.get('/update/:MaSP', productController.edit);
router.get('/delete/:MaSP', productController.delete);
module.exports = router;
