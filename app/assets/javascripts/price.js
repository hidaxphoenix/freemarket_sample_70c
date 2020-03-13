$(function(){

  $('#item_price').on('keyup change', function(){
    
    let input = $('#item_price').val();
    if(input >= 300 && input <= 9999999){
      a = input * 0.1
      commission = Math.floor( a );
      benefit = input - commission
    
      $(function(){
        $(".main__box__price__value__wrapper__form__input__error").empty();
        $(".main__box__price__value__alert").empty();
        $(".main__box__price__value__commission__result").empty();  
        $(".main__box__price__value__commission__result").append(commission);
        $(".main__box__price__value__benefit__result").empty();    
        $(".main__box__price__value__benefit__result").append(benefit);
     });
    }else{
      $(".main__box__price__value__wrapper__form__input__error").empty();
      $(".main__box__price__value__wrapper__form__input__error").append("300以上9999999以下で入力してください");
      $(".main__box__price__value__commission__result").empty();  
      $(".main__box__price__value__commission__result").append("---");
      $(".main__box__price__value__benefit__result").empty();    
      $(".main__box__price__value__benefit__result").append("---");    
    }


  });
});