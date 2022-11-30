class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def search
    @articles = params[:query].present? ? Article.search_by_title(params[:query]) : Article.all

    render turbo_stream: turbo_stream.replace(
      'articles',
      partial: 'list',
      locals: {
        articles: @articles,
      },
    )
  end
end
