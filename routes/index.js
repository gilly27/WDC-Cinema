var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.redirect("/landing");
});

//Page rendering
router.get('/signup', function(req, res, next) {
  res.sendFile('/public/signup.html', { root: __dirname+"/.."});
});

router.get('/landing', function(req, res, next) {
  res.sendFile('/public/landing.html', { root: __dirname+"/.."});
});

module.exports = router;
