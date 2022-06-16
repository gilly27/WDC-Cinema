var express = require('express');
var router = express.Router();

router.get('/*', function(req, res, next) {
  if(req.session["user"])
  {
    next();
  }
  else
  {
    res.redirect('/landing');
  }
});

router.get('/logout', function(req, res, next) {
  req.session.destroy();
});


module.exports = router;
