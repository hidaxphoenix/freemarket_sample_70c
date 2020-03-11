// $(function(){
//   function appendOption(category){
//     var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
//     return html;
//   }

//   function appendChildrenBox(insertHTML){
//     var childSelectHtml = '';
//   }

//   // 親カテゴリーの選択後のイベント
//   $('#item_category_id').on('change', function(){
//     console.log(行けたよ)
//   })
// })

  // 親カテゴリーの選択後のイベント
  $(function(){
    $('#item_category_id').on('change', function(){
      console.log("成功1");
      // 親カテゴリのidを取得
      var parentValue = document.getElementById('item_category_id').value;
      console.log(parentValue);
      $.ajax({
        url: '/items/search',
        type: 'GET',
        data: { parent_id :parentValue},
        dataType: 'json'
      })
      .done(function(){
        
      })
    });
  });

