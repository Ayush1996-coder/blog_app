class PostsController < ApplicationController

	def create
		if current_user.nil?
			flash[:success] = "Please log in or signup first to write your own post on Blog app"
			redirect_to new_user_session_path
		else
		  @post = current_user.posts.build(posts_params)
		  if @post.save
			  flash.now[:success] = "Your blog has been created and posted to your profile page....."
			  redirect_to current_user
		  else
			  redirect_to current_user
			end
		end
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.delete
		flash[:success] = "Your Blog has been deleted successfully."
		redirect_to current_user
	end

	def new
		@post = Post.new(params[:post])
	end

	def show
		if current_user.nil?
			flash[:success] = "Please log in or signup first to see others post on Blog app"
			redirect_to new_user_session_path
	  else
		  @post = current_user.posts.find_by_id(params[:id])
		  @user = User.find(params[:id])
		  @posts = @user.posts
		  @comment = Comment.new
		  @comments = @post.comments
	  end
	end

	private
	def posts_params
		params.require(:post).permit(:content)
	end
end
