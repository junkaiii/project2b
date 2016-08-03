class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :bids, presence: true, numericality: {greater_than: 0}

end
