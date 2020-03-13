$(function(){

  $('#item_price').on('keyup change', function(){
    
    let input = $('#item_price').val();
    if(input >= 300 && input <= 9999999){
      a = input * 0.1
      commission = Math.floor( a );
      benefit = input - commission
    
      $(function(){
        $(".main__box__price__value__alert").empty();

        $(".main__box__price__value__commission__result").empty();  
        $(".main__box__price__value__commission__result").append(commission);
        $(".main__box__price__value__benefit__result").empty();    
        $(".main__box__price__value__benefit__result").append(benefit);
     });
    //  if(commission <= 30){
    //    console.log("aaa");
    //   $(".main__box__price__value__commission__result").empty();  

    //  }
  }else if(input <= 300){
    $(".main__box__price__value__alert").empty();
    $(".main__box__price__value__alert").append("300以上9999999以下で入力してください");
    $(".main__box__price__value__commission__result").empty();  
    $(".main__box__price__value__commission__result").append("---");

    $(".main__box__price__value__benefit__result").empty();    
    $(".main__box__price__value__benefit__result").append("---");    
  }

  });
});