class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end
end
