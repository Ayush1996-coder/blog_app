class UsersController < ApplicationController
  # def new
  # 	@user = User.new
  # end

  def index
    @users = User.all
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
    
  # end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts
  end

  # def create
  # 	@user = User.new(user_params)
  # 	if @user.save
  # 		flash[:success] = "Welcome to Blog app, start blogging"
  # 		log_in @user
  # 		redirect_to @user
  # 	else
  # 		render 'new'
  # 	end
  # end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
