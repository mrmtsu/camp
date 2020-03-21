$(function() {
  // 子カテゴリーを追加するための処理です。
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".parent_category").on("mouseover", function() {
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
    $('#' + id).addClass("now-selected-red");//赤色のcssのためです
    $(".children_category").remove();//一旦出ている子カテゴリ消します！
    $(".grandchild_category").remove();//孫、てめえもだ！
    $.ajax({
      type: 'GET',
      url: '/categories/new',//とりあえずここでは、newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送りますparams[:parent_id]で送られる
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".children_list").append(html);//リストに追加します
      })
      $(document).on("mouseover", ".parent_category", function () {
        $(".child_category").remove();
      });
    });
  });
  
    // 孫カテゴリを追加する処理です基本的に子要素と同じです！
  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}"
               href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
    var id = this.id
    $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
    $('#' + id).addClass("now-selected-gray");//灰色のcssのため
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      console.log(children)
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".grand_children_list").append(html);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });  
});