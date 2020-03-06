class Post < ApplicationRecord
	has_rich_text :content
	has_many :comments, dependent: :destroy
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 5000}
end