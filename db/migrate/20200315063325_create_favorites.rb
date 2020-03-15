class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :post, null:false
      t.timestamps
      t.index [:user_id, :post_id], unique: true
    end
  end
end
