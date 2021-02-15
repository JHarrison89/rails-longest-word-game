class GamesController < ApplicationController
  def new
    @alpha = ('a'..'z').to_a
    @letters = []
    10.times do
      @letters.push(@alpha.sample)
    end
  end

  def score
  end
end


# Generate apla
# Select random letter & save into array
# repeate 10 times
