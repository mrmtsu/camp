$(function(){
  function readAsDataURL(file){
   = `<label class="main-bottom__text__image" for="user_avatar"><i class="fas fa-image image-icon"></i>
                      <input class="main-bottom__text__image__file" type="file" name="user[avatar]" id="user_avatar">
                      <div id="imag1"></div>
                    </label>`
}
  $('#user_avatar').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();

    reader.onload = (function(file){
      console.log(file)
    })(file);
    render.readAsDataURL(file);
  });
});