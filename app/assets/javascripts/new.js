$(function(){
  function readAsDataURL(file){
    `<img id="user_prev" width="100" height="100" src="/uploads/user/avatar/1/takibi.jpg">`
}
  $('#user_avatar').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();

    reader.onload = (function(file){
      console.log(file)
    })(file);
    render.readAsDataURL(file);
  });

  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // プレビュー用のimg（buildImg）を作る
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('#new-image').change(function(e){
    const targetIndex = $(this).parent().data('index');
    console.log(this)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
                  // ↓l
    if (img = $(`#user_prev`)[0]) {
      img.setAttribute('src', blobUrl);

    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
});