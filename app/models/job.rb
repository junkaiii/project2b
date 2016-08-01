class Job < ApplicationRecord
  belongs_to :user
  has_many :reviews
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
