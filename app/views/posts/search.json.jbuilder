json.array! @posts do |post|
  json.id post.id
  json.text post.text
  json.image post.image.url
  json.user_id post.user_id
  json.name post.user.name
  json.user_sign_in current_user
end