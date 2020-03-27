json.text @comment.text
json.created_at @comment.created_at.to_s(:datetime)
json.user.name @comment.user.name
json.user.avatar @comment.user.avatar
json.id @comment.id

