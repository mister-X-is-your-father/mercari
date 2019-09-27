$(function() {
  $(document).on('turbolinks:load', function() {
    if ($("#token_submit") != null) {
      Payjp.setPublicKey("pk_test_9f92988fd17275d180a287b6");
      $("#token_submit").on("click", e => {
        e.preventDefault();
        let card = {
          number: $("#card_number").val(),
          cvc: $("#cvc").val(),
          exp_month: $("#exp_month").val(),
          exp_year: "20" + $("#exp_year").val()
        };
        console.log(card);
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            $("#charge-form").submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  })
  },
);