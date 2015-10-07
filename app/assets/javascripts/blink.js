$(document).ready(function(){
      // makes the horm wiggle
      function open(){
        $('#lefteye').attr('class',"lefteye");
        $('#lefteye').removeClass("lefteyeclose");
      };
      function close(){
        $('#lefteye').removeClass("lefteye");
        $('#lefteye').attr('class',"lefteyeclose");
      };
      setInterval(open, 1000);
      setInterval(close, 1600);
});
