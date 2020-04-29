class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :parent, class_name: 'Comment', optional: true

  def comments
    Comment.where(parent_id: id)
  end

end
