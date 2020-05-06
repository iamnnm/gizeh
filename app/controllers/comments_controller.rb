class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_article
  before_action :set_current_user_article, only: %i[edit update destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    # render json: { error: @comment.errors }, status: 403
    if @comment.parent_id.nil?
      if @comment.save
        render partial: 'comments/entry-point', locals: { comment: @comment }
      else
        render json: { error: 'Can\'t create an empty comment' }, status: 403
      end
    else
      if @comment.save
        render partial: 'comments/parent-list', locals: { comment: @comment }
      else
        render json: { error: 'Can\'t create an empty comment' }, status: 403
      end
    end
  end

  def update; end

  def destroy
    if @comment.nil?
      render json: { error: 'You are trying to delete not your comment.
                             Go away you little scumbag!' }, status: 403
    else
      @comment.destroy
    end
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
