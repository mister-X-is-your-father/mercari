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

  $(DropArea1).on({'dragenter dragover' :function(e){
      e.preventDefault();
    },
    'drop' :function(e){
      e.preventDefault();
      let images = e.originalEvent.dataTransfer.files;
      for (let i = 0; i < images.length; i++) { 
        images_array.push(images[i]);
        let fileReader = new FileReader();
        fileReader.onload = function(e) {
          let loadedImageUrl = e.target.result;
          $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger('create');
        };
        fileReader.readAsDataURL(images[i]);
      }
      if (images_array.length == 10) {
        $(DropArea1).css({
          'display' : 'none'
        })
      }
    },
  });

  //プレビュー画像の削除機能
  $(document).on('click', '.iu-preview-box__text__delete', function(e){
    e.preventDefault();
    //clickした要素が何番目かを取得
    let index = $(".iu-preview-box__text__delete").index(this);
    //spliceメソッドで画像配列の中からindex-1番目の画像を1つ削除する
    images_array.splice(index - 1, 1);
    //削除ボタンの親の親(li)を削除する
    $(this).parent().parent().remove();
  });

  // $(DropArea1).on('change', 'input[type="file"]', function(e){
  //   e.preventDefault();
  //   let images = e.originalEvent.dataTransfer.files;
  //     for (let i = 0; i < images.length; i++) { 
  //       images_array.push(images[i]);
  //       let fileReader = new FileReader();
  //       fileReader.onload = function(e) {
  //       var loadedImageUrl = e.target.result;
  //       $(buildImage(loadedImageUrl)).appendTo(PreviewArea).trigger("create");
  //       };
  //       fileReader.readAsDataURL(images[i]);
  //     }
  //   },
  // );

  $('#item-new').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData($(this).get(0));
    images_array.forEach(function(image, i){
     formData.append(`item[images_attributes][${i}][image]`, image)
    });
    $.ajax({
      url:         '/items',
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

});