$(function(){
  function buildHTML(message){
    var image_url = "";
    if (message.image) {
      image_url = `<img src="${message.image}">`
    }
    var html = `<div class='message' data-id="${message.id}">
                  <div class="message__user-name">
                    ${message.user_name}
                  </div>
                  <div class="message__date">
                    ${message.created}
                  </div>
                  <div class="message__user-message">
                    ${message.body}
                  </div>
                  <div class="message__user-image">
                    ${image_url}
                  </div>
                </div>`
    return html;
  }

   function scroll() {
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast')
    }

   $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('#new_message')[0].reset();
      $('.form__submit ').attr('disabled',false);
        scroll()
    })
    .fail(function(){
      alert('メッセージの送信に失敗しました');
    })
  })

  var interval = setInterval(function() {
      if (location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href.json,
      type: 'GET',
      dataType: 'json'
    })

    .done(function(data) {
      var last_message_id = $('.message').last().data('id');
      var insertHTML = '';
      data.messages.forEach(function(message) {
        if (message.id > last_message_id ) {
          insertHTML += buildHTML(message);
        }
      });
      $('.messages').append(insertHTML);
    })

    .fail(function(data) {
      alert('自動更新に失敗しました');
    });
    } else {
    clearInterval(interval);
   }} , 5 * 1000 );
});

