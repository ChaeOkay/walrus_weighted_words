class WordSearchesController < ApplicationController

  def new
    @word_search = WordSearch.new
  end

  def create
    @word_search = WordSearch.where(word_search_params).first_or_initialize
    if @word_search.persisted?
      render :show
    elsif @word_search.valid_url? && @word_search.weigh_url_words
      render :show
    else
      render :new
    end
  end

  def show
  end

  def index
    @word_searches = WordSearch.all
  end

  private

  def word_search_params
    params.require(:word_search).permit(:url)
  end
end
