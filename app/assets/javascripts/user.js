$(function() {
  function appendSearchUser(user){
    var html = `<div class="chat-group-user clearfix" id='chat-group-user'>
                  <p class="chat-group-user__name">${ user.name }</p>
                   <a class="user_search_add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加
                   </a>
                </div>`
    $('#user-search-result').append(html);
  }

  function appendUsers(name, id){
    var html = `<div id='chat-group-users'>
                  <div class='chat-group-user clearfix' id='chat-group-user-${id}'>
                    <input name='chat_group[user_ids][]' type='hidden' value='${id}'>
                    <p class='chat-group-user__name'>${name}</p>
                    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn data-user-id="${id}" data-user-name="${name}"'>削除</a>
                  </div>
                </div>`
    $("#chat-group-users").append(html)
  }
  $(function() {
  $("#user-search-field").on("keyup", function(e) {
    e.preventDefault()
    var input = $("#user-search-field").val();
    if(input !== ""){
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(users){
        $("#user-search-result").empty();
          users.forEach(function(user){
            appendSearchUser(user);
          })
      })
      .fail(function(){
        alert('error');
      });
    }
    else{
      $('#user-search-result').remove();
    };
  });
});
  $(function() {
    $(document).on("click", '.user_search_add', function() {
      var name = $(this).attr("data-user-name");
      var id = $(this).attr("data-user-id");
      $(this).parent().remove();
      appendUsers(name, id);
    });
    $(document).on("click", '.user-search-remove', function() {
      $(this).parent().remove();
    });
  });
});
