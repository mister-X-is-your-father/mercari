$(function(){

  // var buildHTML = function(message){
  //   var image = message.image.url == null ? "" : `<img src="${message.image.url}">` 
  //   var html = `<div class="message" data-message-id='${message.id}'>
  //                 <div class="message__upper">
  //                   <div class="message__upper__name">
  //                     ${message.user_name}
  //                   </div>
  //                   <div class="message__upper__time">
  //                     ${message.created_at}
  //                   </div>
  //                 </div>
  //                 <div class="message__text">
  //                   <p class="lower-message__content">
  //                     ${message.body}
  //                   </p>
  //                   ${image}
  //                 </div>
  //               </div>`
  //   return html;
  // };

  let DropArea1 = '.iu-image__container__drop-area'
  let DropArea2 = '.drop-area-second'
  let ImgArea = '.iu-image__container__image-area'
  let images_array = []

  $(DropArea1).on({'dragenter dragover' :function(e){
      e.preventDefault();
    },
    'drop' :function(e){
      e.preventDefault();
      let images = e.originalEvent.dataTransfer.files;
      for (let i = 0; i < images.length; i++) { 
        images_array.push(images[i]);
      }

      let html = buildHTML(images[0]); //一旦0で仮置き 画像のurlを取得したい
      $(ImgArea).append(html);

      if (images_array.length >= 5) {
        $(DropArea2).css({
          'display': 'block'
        })
      }

    },
  });

  $('#item-new').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData($(this).get(0));
    images_array.forEach(function(image, i){
     formData.append(`item[images_attributes][${i}][image]` ,image)
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