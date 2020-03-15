class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :post

  has_many :bookmarks

  validates :text, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
end
