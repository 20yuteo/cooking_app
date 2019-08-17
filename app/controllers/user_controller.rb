class UserController < ApplicationController
  def index
    @user = User.find(session[:id])
    @recipe = Recipe.where(user_id: session[:id])
    @like = Like.where(user_id: session[:id])
    
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find(session[:id])
    if @user.update(user_params)
      flash[:success] = "success to update user information!"
      redirect_to("/user")
    else
      flash[:errors] = @user.errors.full_messages
      render("/user/edit")
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :email, :u_image)
  end
  
end

