class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to games_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to games_path, notice: 'You have updated user successfully.'
    else 
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,)
  end
end
