class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		comment = @post.comments.build(comment_params)
		comment.user = current_user
		if comment.save
			flash[:notice] = "Comment created!"
		else
			flash[:danger] = "Not Posted"
		end
		redirect_to @post
	end

	def new
		@comment = Comment.new
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :user_id, :post_id)
		end

end