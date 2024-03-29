class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create!(comment_params)
    redirect_to @post
    CommentsMailer.submitted(comment).deliver_later
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.required(:comment).permit(:content)
  end
end
