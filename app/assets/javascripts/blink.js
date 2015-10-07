$(document).ready(function(){
      // makes the horm wiggle
      function open(){
        $('#eye').attr('class',"eye");
        $('#eye').removeClass("eyeclose");
      };
      function close(){
        $('#eye').removeClass("eye");
        $('#eye').attr('class',"eyeclose");
      };
      setInterval(open, 1000);
      setInterval(close, 1600);
});
