class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :parent, class_name: 'Comment', optional: true

  validates :body, presence: true

  def comments
    Comment.where(parent_id: id)
  end

  def destroy
    if comments.present?
      update(user_id: nil, body: nil)
    else
      super
    end
  end

  def destroy?
    if user.nil?
      true
    else
      super
    end
  end
end
