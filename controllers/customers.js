const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM KhachHang', (err, data) => {
     if (err) {
      res.json(err);
     }
     res.render('khachHang', { data });
    });
  });
};


controller.update = (req, res) => {
  const MaKH = req.params.MaKH;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM KhachHang WHERE MaKH = ?", [MaKH], (err, rows) => {
      res.render('KHACHHANGS_edit', {
        data: rows[0]
      });
    });
  });
};

controller.delete = (req, res) => {
  const MaKH = req.params.MaKH;
  req.getConnection((err, connection) => {
    conn.query('DELETE FROM KhachHang WHERE MaKH = ?', [MaKH], (err, rows) => {
      res.redirect('/');
    });
  });
};

controller.save = (req, res) => {
    const data = req.body;
    req.getConnection((err, connection) => {
        conn.query('INSERT INTO KhachHang set ?', data, (err, results) => {
        res.redirect('/');
      });
    });
};

module.exports = controller;
