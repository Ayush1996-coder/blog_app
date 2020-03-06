class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
		@comment = @post.comments.create(comments_params)
		if @comment.save
			flash[:success] = "Comment success"
			redirect_to user_path
		else
			redirect_to user_path
		end					
	end

	def destroy
    @post = current_user.posts.find(params[:id])
		@comment = @post.comments.find(params[:id])
		@comment.delete
		redirect_to user_path
	end

	def new
		@comment = Comment.new
	end

	private
	def comments_params
		params.require(:comment).permit(:name, :comment)
	end
end
