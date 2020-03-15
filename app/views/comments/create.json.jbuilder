json.text @comment.text
json.user_id @comment.user.id
json.user_name @comment.user.name
json.created_at @comment.created_at.to_s(:datetime)
json.id @comment.id