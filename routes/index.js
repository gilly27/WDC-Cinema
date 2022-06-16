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
      console.log(error);
      return;
    }

    let query = "SELECT movie_name, start_time FROM movie INNER JOIN screening ON movie.movie_id = screening.movie_id;"
    connection.query(query, function(error,rows, fields) {
      connection.release();
      if(error) {
        res.sendStatus(500);
        console.log(error);
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
