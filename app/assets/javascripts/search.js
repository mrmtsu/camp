$(function() {
  var search_list = $(".search__topics");

  function appendPost(post) {
    var html = `<a class="content__topic__lists a" href="/posts/${post.id}">
                  <img src=${post.image}>
                </a>`;
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="search__topics">${ msg }</div>`
    search_list.append(html);
  }

  $(".search__form__input").on("keyup", function() {
    var input = $(".search__form__input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      $(".search__topics").empty();
      if (posts.length !== 0) {
        posts.forEach(function(post) {
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がございません");
      }
    })
    .fail(function() {
      console.log("失敗です");
    });
  });
});









