$(function() {
  // 子カテゴリーを追加するための処理です。
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".parent_category").on("mouseover", function() {
    var id = this.id//どのリンクにマウスが乗ってるか取得
    $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのため
    $('#' + id).addClass("now-selected-red");//赤色のcssのため
    $(".children_category").remove();//一旦出ている子カテゴリ消す
    $(".grandchild_category").remove();
    $.ajax({
      type: 'GET',
      url: '/categories/new',//newアクションに飛ばす
      data: {parent_id: id},//どの親の要素かをparams[:parent_id]で送る
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".children_list").append(html);//リストに追加
      })
      $(document).on("mouseover", ".parent_category", function () {
        $(".child_category").remove();
      });
    });
  });
  
    // 孫カテゴリを追加する処理です基本的に子要素と同じ。
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