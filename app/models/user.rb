class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_name

  has_many :articles
  has_many :comments

  validates :name, presence: true, length: { maximum: 16 }

  def set_name
    self.name = "unit #{rand(999)}" if name.blank?
  end
end
