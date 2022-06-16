var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/*', function(req, res, next) {
  res.redirect("/main");
});

//Page rendering
router.get('/main', function(req, res, next) {
  res.sendFile('/public/main.html', { root: __dirname+"/.."});
});

module.exports = router;
