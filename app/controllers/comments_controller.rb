class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_article
  before_action :set_current_user_article, only: %i[edit update destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, success: 'Comment has created!'
    else
      redirect_to @article, error: 'Something went wrong!'
    end
  end

  def destroy
    @comment.destroy

    redirect_to @article, success: 'Post has deleted!'
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_current_user_article
    @comment ||= current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id, :parent_id)
  end
end
