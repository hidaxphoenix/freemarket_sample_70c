$(function(){
  $("#condition").on('change',function(){
    var delivery_parentCategory = ""
    delivery_parentCategory = document.getElementById('condition').value;
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