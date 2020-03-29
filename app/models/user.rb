class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :bookmarks, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, uniqueness: true, length: { maximum: 8 }
  

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def bookmarked_by?(user)
    passive_bookmarks.find_by(post_id: user.id).present?
  end

  def create_notification_following!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'following'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'following'
      )
      notification.save if notification.valid?
    end
  end
  
end
