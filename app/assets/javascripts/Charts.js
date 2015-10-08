$(function(){


var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [10, 30, 50, 60, 70, 80, 90]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(15,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [10, 25, 35, 55, 65, 75, 90]
        }
            ]
    };

var myLine = new Chart(document.getElementById("myChart").getContext("2d")).Line(data)
var myBar = new Chart(document.getElementById("myBarChart").getContext("2d")).Bar(data)
});
