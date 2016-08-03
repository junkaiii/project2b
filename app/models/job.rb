class Job < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bids
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}

  def self.search(search)
  where("content LIKE ?", "%#{search}%")
  end


end
