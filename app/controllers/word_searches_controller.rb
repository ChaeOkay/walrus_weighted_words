class WordSearchesController < ApplicationController

  def new
    @word_search = WordSearch.new
  end

  def create
    @word_search = WordSearch.where(word_search_params).first_or_initialize
    if @word_search.persisted?
      render :show
    elsif valid_url? && make_weighted_words(@word_search)
      render :show
    else
      flash.now[:notice] = I18n.t('word_search.errors.unparsable')
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

  def make_weighted_words(word_search)
    WeightedWordSearchMaker.new(word_search: word_search, words_map: url_words)
      .make_weighted_words
  end

  def url_words
    UrlWords.new(url: word_search_params[:url]).words_map
  end

  def valid_url?
    UrlValidator.valid?(word_search_params[:url])
  end
end
