$(document).on 'turbolinks:load', ->
  $('#post-tags').tagit
    fieldName:   'category_list'
    singleField: true
  $('#post-tags').tagit()
  category_string = $("#category_hidden").val()
  try
    category_list = category_string.split(',')
    for tag in category_list
      $('#post-tags').tagit 'createTag', tag
  catch error