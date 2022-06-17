var vueinst = new Vue({

    el: "#app",

    data:{
        currentMovies: [],
        currentScreenings: [],
        currentSeats: [],
    },

    methods:{
        getScreenings: function(movieName) {

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function()
                {
                    vueinst.currentScreenings = [];
                    if(this.readyState == 4 && this.status == 200)
                    {
                        vueinst.currentScreenings = JSON.parse(this.responseText);
                        vueinst.currentScreenings.forEach(convertDate);
                    }
                };

            xhttp.open("GET", "/getscreenings?movieName="+movieName, true);
            xhttp.send();
        },

        getSeats: function(screeningID) {

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function()
                {
                    vueinst.currentSeats = [];
                    if(this.readyState == 4 && this.status == 200)
                    {
                        vueinst.currentSeats = JSON.parse(this.responseText);
                    }
                };


            xhttp.open("GET", "/getseats?screeningID="+screeningID, true);
            xhttp.send();
        }
    }

});

function getMovies(){

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function()
    {
        vueinst.currentMovies = [];
        if(this.readyState == 4 && this.status == 200)
        {
             vueinst.currentMovies = JSON.parse(this.responseText);
        }
    };

    xhttp.open("GET", "/getmovies", true);
    xhttp.send();

}

function convertDate(movie)
{

    movie.time = movie.start_time.split("T")[1];
    movie.time = movie.time.slice(0, -8);
    movie.date = movie.start_time.replace(/-/g, '\/').split("T")[0].split("/").reverse().join("/");

}