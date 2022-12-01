class QueriesController < ApplicationController
  def search
    query = params[:query]

    if params[:finished] == 'true' && !query.empty?
      @query = @current_user.queries.create(query:)
    end

    @articles = query.present? ? Article.search_by_title(query) : Article.all

    render turbo_stream: turbo_stream.replace('articles', partial: 'articles/list', locals: { articles: @articles })
  end
end
