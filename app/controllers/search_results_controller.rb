class SearchResultsController < ApplicationController
  def index
    if params[:search_term]
      @results = SearchResult.
        new(search_params).
        results.group_by { |result| result.class.name }
    end
  end

  private

  def search_params
    { 
      query: params[:search_term], 
      filter_by: params[:filter_by],
      sort_by: params[:sort_by]
    }
  end
end