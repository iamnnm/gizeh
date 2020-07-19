class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :post, presence: true
  validates :title, length: { maximum: 100 }
  validates :post, length: { maximum: 10_000 }
  validates_associated :user

  scope :posted, -> { where(post: '5') }
end
