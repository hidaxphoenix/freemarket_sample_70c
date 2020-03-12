window.addEventListener("load", function(){
  var count = null,
  lest = null,
  max = 1000,
  input_area = document.getElementById("textArea");
  output_lest = document.getElementById("textLest");

  input_area.onkeyup = function(){
      var length = input_area.value.length;
      lest =  max - length;
      output_lest.innerText = lest;
  }
}, false);
