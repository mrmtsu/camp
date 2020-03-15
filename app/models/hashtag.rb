class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}
  has_and_belongs_to_many :posts
end
