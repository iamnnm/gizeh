class ArticlesController < ApplicationController
  before_action :set_article, except: %i[index new create]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @article = Article.new
    else
      redirect_back(fallback_location: root_path,
                    notice: 'You have to sign in or sign up!')
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: 'Post has created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Post has updated!'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def set_article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :post)
  end
end
