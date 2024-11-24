class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to games_path, notice: 'You have created comment successfully.'
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    
    if @comment.user != current_user
      redirect_to games_path
    end

  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to games_path, notice: 'You have updated comment successfully.'
    else
      render :edit
    end 
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to games_path
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end