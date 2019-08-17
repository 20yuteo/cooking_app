class HomeController < ApplicationController
  
  def top
    @recipe = Recipe.all.to_a
    
    3.times do 
        kinds = ["japanese", "western", "chinese"]
        1.times do
          kind = kinds[rand(0..2)]
          @special_recipe = Recipe.where(kind: kind)
            if kind == "japanese"
              @kind_name = "和食"
            elsif kind == "western"
              @kind_name = "洋食"
            elsif kind == "chinese"
              @kind_name = "中華"
            end
        end
    end
    
    recipe_rank = Recipe.all
    
    @rank01 = 0
    
    @rank02 = 0
    
    @rank03 = 0
    
        recipe_rank.each do |rank|
      rank_num = Like.where(like_recipe_id: rank.id)
      if @rank01 <= rank_num.length
        @rank01 = rank_num.length
        @rank01_id = rank.id
      elsif @rank02 <= rank_num.length
        @rank02 = rank_num.length
        @rank02_id = rank.id
      elsif @rank03 <= rank_num.length
        @rank03 = rank_num.length
        @rank03_id = rank.id
      end
    end
    
    @rank_no1 = Recipe.find(@rank01_id)

    @rank_no2 = Recipe.find(@rank02_id)

    @rank_no3 = Recipe.find(@rank03_id)

    
  end
  
  def login
  end
  
  def makesure
    @user = User.find_by( email: params[:email], password: params[:password])
    if @user
      session[:id] = @user.id
      flash[:success] = "welcome to our site!"
      redirect_to("/home")
    else
      flash.now[:errors] = ["undefined users","please signup here"]
      render("home/signup")
    end
  end
  
  def signup
  end
  
  def create
      @user = User.new(name: params[:name], password: params[:password], email: params[:email])
    if @user.save
      session[:id] = @user.id
      redirect_to("/home")
    else
      flash.now[:errors] = @user.errors.full_messages
      render("home/signup")
    end
  end
  
  def logout
      session[:id] = nil
      render("home/login")
  end

end
