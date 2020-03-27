$(function(){
  


  function buildHTML(comment){
    var html = `<div class="comment__list__form">
                  <img class="cooment-avatar" src="${comment.user_avatar}">
                  <a href=/users/${comment.user_id}>${comment.user_name}</a>
                  <h4>${comment.created_at}</h4>
                </div>
                <div class="comment__list__text" data-comment-id=${comment.id}>
                  <h3>${comment.text}</h3>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(comment){
      var html = buildHTML(comment);
      $('.comment__list').append(html);
      $('#comment_text').val('');
      $('.comment__btn').prop('disabled', false);
      $('.comment').animate({ scrollTop: $('.comment')[0].scrollHeight});
    })
    .fail(function() {
      alert('error');
    });
  })

  var reloadComments = function() {
    var last_comment_id = $('.comment__list__text:last').data("comment-id");
    $.ajax({
      url: "api/comments",
      type: 'GET',
      dataType: 'json',
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      if (comments.length !== 0) {
        var insertHTML = '';
        $.each(comments, function(i, comment) {
          insertHTML += buildHTML(comment)
        });
        $('.comment__list').append(insertHTML);
        $('.comment__list').animate({ scrollTop: $('.comment__list')[0].scrollHeight});
      }
    })
    .fail(function() {
      console.log('error');
    });
  };
  if (document.location.href.match(/\/posts\/\d+\//)) {
    setInterval(reloadComments, 7000);
  }
});


