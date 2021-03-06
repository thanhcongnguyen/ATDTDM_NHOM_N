var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    req.getConnection((err, connection) => {
        connection.query('SELECT * FROM SanPham', (err, data) => {
         if (err) {
          res.json(err);
         }
         res.render('Products', { data });
        });
    });
});

// router.post('/create', function(req, res, next) {
//     const data = req.body;
//     req.getConnection((err, connection) => {
//         connection.query('INSERT INTO SanPham set ?', data, (err, results) => {
//         res.redirect('/');
//       });
//     });
// });

// router.get('/update/:MaSP', function(req, res, next) {
//     const MaKH = req.params.MaKH;
//     req.getConnection((err, conn) => {
//         connection.query("SELECT * FROM SanPham WHERE MaSP = ?", [MaKH], (err, rows) => {
//         res.render('SanPham_Update', {
//             data: rows[0]
//         });
//         });
//     });
// });

// router.get('/delete/:MaSP', function(req, res, next) {
//     const MaKH = req.params.MaKH;
//     req.getConnection((err, connection) => {
//         connection.query('DELETE FROM SanPham WHERE MaSP = ?', [MaKH], (err, rows) => {
//         res.redirect('/');
//     });
//     })
// });

module.exports = router;
