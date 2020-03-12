$(function(){
  var array1 = [ '未定','らくらくメルカリ便','ゆうメール','レターパック','普通郵便（定型、定型外）',
  'クロネコヤマト','ゆうパック','クリックポスト','ゆうパケット' ]
  var array2 = ['ゆうメール','クロネコヤマト','ゆうパック']

  function appendOption(method){
    var html = `<option value="${method}">${method}</option>`;
    return html;
  }


  $("#ship_charge").on('change',function(){
    var delivery_parentCategory = ""

    delivery_parentCategory = document.getElementById('ship_charge').value;
    
    if (delivery_parentCategory != "0"){


    $.ajax({
        url: 'get_delivery_method',
        type: 'GET',
        data: { parent_name: delivery_parentCategory },
        dataType: 'json'

      })

      .done(function(method){
        $('#delivery_method-parent').remove();
        
        var methodBoxHtml = '';
        var insertHTML = '';

        if (delivery_parentCategory == "1"){
          array1.forEach(function(method){
          insertHTML += appendOption(method);
          
          });
          
        }else (delivery_parentCategory == "2");{
          array2.forEach(function(method){
          insertHTML += appendOption(method);
          // debugger
          });
        }
        methodBoxHtml = `<div class="listing-product-delivery-method" id="delivery_method-parent"> 
                          <label class='listing-default__label'> 配送の方法</label> 
                          <span class='listing-default--require'>必須</span> 
                            <div class='listing-select-wrapper__box'>
                              <div class='listing-select-wrapper'></div>
                                <select class="listing-select-wrapper__box--select" id="delivery_charge">
                                  <option value="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>
                          </div>`;
      $('.listing-product-delivery-charge-burden').append(methodBoxHtml);

        console.log(delivery_parentCategory)
      })
    }
    else {$('#ship_method').remove();}

  });

});