var express = require('express');
var router = express.Router();
const CustomerController = require('../controllers/customers.js');
router.get('/', CustomerController.list);
router.post('/create', CustomerController.save);
router.get('/update/:MaKH', CustomerController.edit);
router.get('/delete/:MaKH', CustomerController.delete);
module.exports = router;
