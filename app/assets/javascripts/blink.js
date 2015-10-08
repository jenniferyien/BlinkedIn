$(function(){
  //blinking functions remove and add class
  function open(){
    $('#lefteye').attr('class',"lefteye");
    $('#lefteye').removeClass("lefteyeclose");
  };
  function close(){
    $('#lefteye').removeClass("lefteye");
    $('#lefteye').attr('class',"lefteyeclose");
  };
  //intervals in which it switches off between class
  setInterval(open, 1000);
  setInterval(close, 1600);
});
