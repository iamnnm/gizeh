class Article < ApplicationRecord
  before_validation :log

  scope :posted, -> { where(post: '5') }

  validates :title, :post, presence: true

  private

  def log
    puts
    puts '  HELLO'
    puts
  end
end
