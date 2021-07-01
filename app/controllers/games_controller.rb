require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    # display random grid and score
    # something like this ('a'..'z').to_a.sample(10)
    # store in @letters and display in the view
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score

    @word = params[:word]
    @letters = params[:letters]
    @exist = @word.chars.all? {|letter| @letters.include?(letter) }
      if @exist
        if check_word(@word)
          @message = "Valid word!"
        else
          @message = "Not a valid word, sucker!"
        end
      else
        @message = "Word does not exist in the grid."
        # check with API call


    end


    # @exist = @word.include?(@letters.split(" "))
    # logic time: check if the letters in the word match the letters in the grid
    # if word is valid in grid, but not a valid English word
    # the word is valid in the grid and a valid English word
  end
  private
  def check_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    result = open(url).read
    @found = JSON.parse(result)
    @found["found"]
  end

end
