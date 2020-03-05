class PostsController < ApplicationController

	def create
		if current_user.nil?
			flash[:success] = "Please log in or signup first to write your own post on Blog app"
			redirect_to root_url
		else
		  @post = current_user.posts.build(posts_params)
		  if @post.save
			  flash.now[:success] = "Your blog has been created and posted to your profile page....."
			  redirect_to @current_user
		  else
			  redirect_to @current_user
			end
		end
	end

	def destroy
		@post.delete
		flash[:success] = "Your Blog has been deleted successfully."
		redirect_to @current_user
	end

	def new
		@post = Post.new
	end

	private
	def posts_params
		params.require(:post).permit(:content)
	end
end
