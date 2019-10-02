$(function(){
  //カテゴリー選択機能
  function buildCategory(category){
    let html = `<option value="${category.id}">${category.name}</option>`
    return html
  };

  function appendChildCategory(insertHTML){
    let ChildCategoryHTML = 
      `<div class="select-wrap iu-child">
        <select id="child-categories" name="item[category_id]">
          <option value="">---</option>
          ${insertHTML}
      </div>`
    $('.select-wraps').append(ChildCategoryHTML)
  };

  function appendGrandChildCategory(insertHTML){
    let GrandChildCategoryHTML = 
      `<div class="select-wrap iu-grandchild">
        <select id="grandchild-categories" name="item[category_id]">
          <option value="">---</option>
          ${insertHTML}
      </div>`
    $('.select-wraps').append(GrandChildCategoryHTML)
  };
  
  //親カテゴリー選択時
  $('#parent-categories').on('change', function(e){
    e.preventDefault();
    let parent_id = $(this).val();
    if (parent_id != ''){
      $.ajax({
        url:         '/items/get_child_categories',
        type:        'GET',
        data:        { parent_category: parent_id },
        dataType:   'json'
      })
      .done(function(child){
        $('.select-wrap.iu-child').remove();
        $('.select-wrap.iu-grandchild').remove();
        let insertHTML = '';
        child.forEach(function(child_category){
          insertHTML += buildCategory(child_category);
        })
        appendChildCategory(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else {
      $('.select-wrap.iu-child').remove();
      $('.select-wrap.iu-grandchild').remove();
    }
  });

  //子カテゴリー選択時
  $('.select-wraps').on('change', '.select-wrap.iu-child', function(e){
    e.preventDefault();
    let child_id = $(this).children().val();
    if (child_id != ''){
      $.ajax({
        url:         '/items/get_grandchild_categories',
        type:        'GET',
        data:        { child_category: child_id },
        dataType:   'json'
      })
      .done(function(grandchild){
        $('.select-wrap.iu-grandchild').remove();
        let insertHTML = '';
        grandchild.forEach(function(grandchild_category){
          insertHTML += buildCategory(grandchild_category);
        })
        appendGrandChildCategory(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else {
      $('.select-wrap.iu-grandchild').remove();
    }
  });

});