var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.redirect("/main");
});

//Page rendering
router.get('/main', function(req, res, next) {
  res.sendFile('/public/main.html', { root: __dirname+"/.."});
});

//get list of current movies

router.get('/getmovies', function(req, res) {

  req.pool.getConnection(function(error, connection) {
    if(error){
      res.sendStatus(500);
      return;
    }

    let query = "SELECT (movie_name, start_time) FROM screening INNER JOIN movie ON screening.movie_id = movie.movie_id;"
    connection.query(query, function(error,rows, fields) {
      connection.release();
      if(error) {
        res.sendStatus(500);
        return;
      }
      else
      {
        res.send(rows);
        return;
      }
      });

    });

});


module.exports = router;
