$(function(){

  function buildImage(loadedImageUrl){
    var html =
    `<li class="iu-preview-box">
      <figure class="iu-preview-box__image">
        <img src=${loadedImageUrl}>
      </figure>
      <div class="iu-preview-box__text">
        <a class="iu-preview-box__text__edit">編集</a>
        <a class="iu-preview-box__text__delete">削除</a>
      </div>
    </li>`
    return html
  };

  let DropArea1 = '.iu-image__container__drop-area'
  let DropArea2 = '.iu-image__container__drop-area-second'
  let PreviewArea = '.iu-image__container__preview-area__images ul'
  let images_array = []

  //編集画面時に既存の画像をimages_arrayへ代入
  $(window).load(function(e){
    e.preventDefault();
    let old_images = $('.iu-preview-box__image').children('img').attr('src');
    images_array.push()
  });

  //ドロップダウン投稿機能
  $(DropArea1).on({'dragenter dragover' :function(e){
      e.preventDefault();
    },
    'drop' :function(e){
      e.preventDefault();
      let images = e.originalEvent.dataTransfer.files;
      for (let i = 0; i < images.length; i++) {
        images_array.push(images[i]);
        let fileReader = new FileReader();
        //読み込みが成功した時にfunctionを作動
        fileReader.onload = function(e) {
          //画像URLを取得
          let loadedImageUrl = e.target.result;
          //HTMLへ画像を代入
          $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger('create');
        };
        //画像ファイルの読み込みを行う
        fileReader.readAsDataURL(images[i]);
      }

      //画像が10個アップロードされたらドロップエリアを消す
      if (images_array.length == 10) {
        $(DropArea1).css({
          'display' : 'none'
        })
      }
    },
  });

  //クリック投稿機能
  $(DropArea1).on('change', 'input[type="file"]', function(e){
    e.preventDefault();
    let images = $(this).prop('files')
      for (let i = 0; i < images.length; i++) {
        images_array.push(images[i]);
        let fileReader = new FileReader();
        fileReader.onload = function(e) {
        var loadedImageUrl = e.target.result;
        $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger("create");
        };
        fileReader.readAsDataURL(images[i]);
      }
    },
  );

  //プレビュー画像の削除機能
  //動的に追加された要素に対してはdocumentを指定して一旦全ページを読み込ませる
  $(document).on('click', '.iu-preview-box__text__delete', function(e){
    e.preventDefault();
    //clickした要素が何番目かを取得
    let index = $(".iu-preview-box__text__delete").index(this);
    //spliceメソッドで画像配列の中からindex-1番目の画像を1つ削除する
    images_array.splice(index - 1, 1);
    //削除ボタンの親の親(li)を削除する
    $(this).parent().parent().remove();
  });



  //商品出品機能
  $('#item-new').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData($(this).get(0));
    images_array.forEach(function(image, i){
      formData.append(`item[images_attributes][${i}][image]`, image)
    });
    let url = $(this).attr('action')
    $.ajax({
      url:         url,
      type:        'POST',
      data:        formData,
      contentType: false,
      processData: false,
      dataType:   'html'
    })
    .done(function(data){
      window.location = '/'
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      alert('出品に失敗しました！');
    });
  })

    //商品編集機能
    $('#item-update').on('submit', function(e){
      e.preventDefault();
      let formData = new FormData($(this).get(0));
      images_array.forEach(function(image, i){
        formData.append(`item[images_attributes][${i}][image]`, image)
      });
      let url = $(this).attr('action')
      $.ajax({
        url:         url,
        type:        'POST',
        data:        formData,
        contentType: false,
        processData: false,
        dataType:   'html'
      })
      .done(function(data){
        window.location = '/'
      })
      .fail(function(){
        alert('編集に失敗しました！');
      });
    })

///////////////////////////////////////////////////////////////////////////////////

  //カテゴリー選択機能
  function buildCategory(category){
    let html = `<option value="${category.id}">${category.name}</option>`
    return html
  };

  function buildSearchCategory(category){
    let html =
      `<div class="ssb-contents__each-checkbox">
        <input type="checkbox" value="${category.id}" name="q[category_id_in][]" id="q_category_id_in_${category.id}">
        <div class="ssb-contents__each-checkbox__label">
        <label class="font__size-12px">${category.name}</label>
      </div>
      </div>`
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
    $('.select-wraps').append(GrandChildCategoryHTML);
  };

  function appendSearchGrandChildCategory(insertHTML){
    let GrandChildCategoryHTML =
      `<div class="search-wrap iu-grandchild">
      <input type="hidden" name="q[category_id_in][]" value[]>
      ${insertHTML}
      </div>`
    $('.select-wraps').append(GrandChildCategoryHTML);
  }

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
        $('.search-wrap.iu-grandchild').remove();
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
      $('.search-wrap.iu-grandchild').remove();
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
        $('.search-wrap.iu-grandchild').remove();
        var insertHTML = '';
        let pathname = location.pathname;
        if (pathname.indexOf('search') == -1 ) {
        // if (pathname != '/items/search*') {
          grandchild.forEach(function(grandchild_category){
            insertHTML += buildCategory(grandchild_category);
          })
          appendGrandChildCategory(insertHTML);
        } else {
          grandchild.forEach(function(grandchild_category){
            insertHTML += buildSearchCategory(grandchild_category);
          })
          appendSearchGrandChildCategory(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else {
      $('.select-wrap.iu-grandchild').remove();
      $('.search-wrap.iu-grandchild').remove();
    }
  });

});