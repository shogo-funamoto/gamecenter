class GamesController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.all
  end



  def show
  end
end
