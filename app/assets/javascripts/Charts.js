$(function(){

var numberOfUsers = gon.watch('everything', usercount)

function usercount(numberOfUsers) {
  var alumni = [
    {
        value: numberOfUsers[0],
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Registered Alumni"
    },
    {
        value: numberOfUsers[1],
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Registered Employers"
    } ]
      var myLine = new Chart(document.getElementById("myChart").getContext("2d")).Pie(alumni)
      // var myBar = new Chart(document.getElementById("myBarChart").getContext("2d")).Bar(alumni)
    };


});
