class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.where(status: "public").
                or(Article.where(status: "private").and(Article.where(user: @current_user)))
    render json: @articles
  end

  def get_archived
    @articles = Article.where(user: @current_user).where(status: 'archived')
    render json: @articles
  end

  def current_users_articles
    @articles = Article.where(user: @current_user).where.not(status: 'archived')
    render json: @articles
  end

  def show
    if(@article.status == 'archived')
      return render json: {
        message: "This article is archived."
      },
      status: :bad_request
    end

    if(@article.status == 'private' && @article.user != @current_user)
      return render json: {
        message: "This article is private, only the owner of the article can access it."
      },
      status: :unauthorized
    end

    render json: @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = @current_user

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if(@article.user != @current_user)
      return render json: {
        message: "This article is private, only the owner of the article can access it."
      },
      status: :unauthorized
    end

    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if(@article.user != @current_user)
      return render json: {
        message: "This article is private, only the owner of the article can access it."
      },
      status: :unauthorized
    end

    @article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = @article || Article.find(params[:id])
    # check it (why || ?)
  end
end
