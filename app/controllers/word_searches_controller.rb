class WordSearchesController < ApplicationController

  def new
    @word_search = WordSearch.new
  end

  def create
    @word_search = WordSearch.where(word_search_params).first_or_initialize
    if @word_search.valid?
      @word_search.save
      render :show
    else
      render :new
    end
  end

  def show
  end

  private

  def word_search_params
    params.require(:word_search).permit(:url)
  end
end
