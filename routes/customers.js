var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    req.getConnection((err, connection) => {
        connection.query('SELECT * FROM KhachHang', (err, data) => {
         if (err) {
          res.json(err);
         }
         res.render('Customer', { data });
        });
    });
});

router.post('/create', function(req, res, next) {
    const data = req.body;
    req.getConnection((err, connection) => {
        connection.query('INSERT INTO KhachHang set ?', data, (err, results) => {
        res.redirect('/');
      });
    });
});

router.get('/update/:MaKH', function(req, res, next) {
    const MaKH = req.params.MaKH;
    req.getConnection((err, connection) => {
        connection.query("SELECT * FROM KhachHang WHERE MaKH = ?", [MaKH], (err, rows) => {
        res.render('Customer_Update', {
            data: rows[0]
        });
        });
    });
});

router.get('/delete/:MaKH', function(req, res, next) {
    const MaKH = req.params.MaKH;
    req.getConnection((err, connection) => {
        connection.query('DELETE FROM KhachHang WHERE MaKH = ?', [MaKH], (err, rows) => {
        res.redirect('/');
    });
    })
});

module.exports = router;
