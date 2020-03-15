class CreatePostHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :hashtags_posts, id: false  do |t|
      t.integer :post_id, index: true, foreign_key: true
      t.integer :hashtag_id, index: true, foreign_key: true
    end
  end
end