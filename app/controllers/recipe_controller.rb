class RecipeController < ApplicationController
  def index
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def post
    @recipe = Recipe.new
  end
    
  def submit
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:id]
    if @recipe.save
      flash[:success] = "success to upload recipes!"
      redirect_to("/home")
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to("/recipe/post")
    end
  end
  
  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def re_submit
    @recipe = Recipe.find_by(id: params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = "success to edit recipes!"
      redirect_to("/home")
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to("/recipe/edit/<%= @recipe.id%>")
    end
  end
  
  def like
    like = Like.new(user_id: session[:id], like_recipe_id: params[:id])
    like.save
    @recipe = Recipe.find(params[:id])

    redirect_to("/recipe/show/#{params[:id]}")
  end
  
  def dislike
    like = Like.find_by(user_id: session[:id], like_recipe_id: params[:id].to_i)
    like.destroy
    @recipe = Recipe.find(params[:id])
    
    redirect_to("/recipe/show/#{params[:id]}")
  end
  
  def delete
    Recipe.find_by(id: params[:id].to_i).delete
    flash[:success] = "success to delete recipe!"
    redirect_to(root_path)
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:id, :title, :ingredient, :how_to, :kind, :r_image)
  end

end
