$(function(){

var numberOfUsers = gon.watch('everything', usercount)

function usercount(numberOfUsers) {
    var alumni = {
      labels: ['Jan','feb'],
        datasets: [{

            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [parseInt(numberOfUsers[0]), parseInt(numberOfUsers[1]), parseInt(numberOfUsers[2])]
        }
      ]
    }
      var myLine = new Chart(document.getElementById("myChart").getContext("2d")).Line(alumni)
       var myBar = new Chart(document.getElementById("myBarChart").getContext("2d")).Bar(alumni)
    };


});
