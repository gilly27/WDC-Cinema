var vueinst = new Vue({

    el: "#app",
    data:{
    currentScreenings: []
    }

});

function getScreenings(){

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function()
    {
        vueinst.currentScreenings = [];
        if(this.readyState == 4 && this.status == 200)
        {
             vueinst.currentScreenings = JSON.parse(this.responseText);
             //vueinst.currentScreenings.forEach(convertDate);
             console.log(currentScreenings);
        }
    };

    xhttp.open("GET", "/getmovies");
    xhttp.send();

}

/*function convertDate(movie)
{

    movie.time = movie.start_time.split("T")[1];
    movie.time = movie.time.slice(0, -8)
    movie.date = movie.start_time.replace(/-/g, '\/').split("T")[0].split("/").reverse().join("/");

}*/

