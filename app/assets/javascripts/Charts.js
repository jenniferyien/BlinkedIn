$(function(){
    // grabbing value from ruby
    var numberOfUsers = gon.watch('everything', usercount);
    // function for usercount passing in data from ruby
    function usercount(numberOfUsers) {
      var alumni = [
        {
            value: numberOfUsers[0],
            color:"#F7464A",
            highlight: "#FF5A5E",
            label: "Alumni"
        },
        {
            value: numberOfUsers[1],
            color: "#46BFBD",
            highlight: "#5AD3D1",
            label: "Employers"
        } ]
          // pass in value of alumni into chart
          var myLine = new Chart(document.getElementById("myChart").getContext("2d")).Pie(alumni)
        };

      // grabbing value from ruby for skills
      var skillsvalue = gon.watch("allskills", popularskills);
      // function to pass in value for skills
      function popularskills(skillsvalue){
        var data = {
            labels: ["jQuery", "Javascript", "Rails", "HTML/CSS", "React.js", "AJAX", "PostgreSQL"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(220,220,220,0.5)",
                    strokeColor: "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data: [skillsvalue[0], skillsvalue[1], skillsvalue[2], skillsvalue[3], skillsvalue[4], skillsvalue[5], skillsvalue[6]]
                }
            ]
        };
          // pass in value of skills into chart
        var myBar = new Chart(document.getElementById("myBarChart").getContext("2d")).Bar(data)
      };

});
