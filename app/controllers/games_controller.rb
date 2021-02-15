require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @alpha = ('a'..'z').to_a
    @letters = []
    10.times do
      @letters.push(@alpha.sample)
    end
  end

  def score
    @answerString = params[:answer]
    @answer = params[:answer].split("")
    @a = params[:answer]
    @letters = params[:letters].split(" ")

    if english_word?(@answerString) && included?(@answer, @letters)
      @result = "congratulations! #{@a} is a valid word"
    elsif english_word?(@answerString) && !included?(@answer, @letters)
      @result = 'Letters no included'
    else
      @result = 'answer is not a word'
    end
  end

  private

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

  def included?(answer, letters)
    @answer.all? { |x| @letters.include?(x) }
  end
end
