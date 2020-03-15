class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :text
      t.text :image
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :posts, :text,                 length: 32
  end
end
