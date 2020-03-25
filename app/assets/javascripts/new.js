$(function(){
  let buildHTML = (imageUrl) => {
    let html = `<img width="250" height="250" class="prevew-image" src="${imageUrl}">`
    return html;
  }

  $('.image-list').change(function(e){
    let file = e.target.files[0];
    const imageUrl = window.URL.createObjectURL(file);
    $('.prevew-image').remove();
    $('.new-post').append(buildHTML(imageUrl));
  })
})