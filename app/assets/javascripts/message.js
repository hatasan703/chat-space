$(function(){
  function buildHTML(message){

    var html = `<div class="message">
                  <div class="message__user-name">
                    ${message.user_name}
                  </div>
                  <div class="message__date">
                    ${message.created_at}
                  </div>
                  <div class="message__user-message">
                    ${message.body}
                  </div>
                  <div class="message__user-image">
                    ${ message.image_url }
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
    // $('.form__submit').removeAttr('data-disable-with')
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
      alert('error');
    })
  })
});
