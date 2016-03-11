class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		comment = @post.comments.build(comment_params)
		comment.user = current_user
		if comment.save
			flash[:notice] = "Comment created!"
			redirect_to root_url
		else
			redirect_to root_url
		end
	end

	def new
		@comment = Comment.new
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :user_id, :post_id)
		end

end