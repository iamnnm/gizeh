class Article < ApplicationRecord
  belongs_to :user

  before_validation :log

  scope :posted, -> { where(post: '5') }

  validates :title, :post, :user, presence: true

  has_many :comments

  private

  def log
    puts
    puts '  HELLO'
    puts
  end
end
