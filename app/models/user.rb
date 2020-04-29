class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments

  validates :name, presence: true, length: { maximum: 16 }

  before_validation :set_name

  def set_name
    self.name = "unit #{rand(999)}" if
      name.blank?
  end
end
