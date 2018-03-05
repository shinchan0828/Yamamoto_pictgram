class CommentsController < ApplicationController
  def index
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.topic_id = params[:topic_id]

    @comment.save
    if @comment.save
      redirect_to topics_path, notice: 'コメントの投稿が完了しました'
    else
      flash.now[:alert] = 'コメントの投稿に失敗しました'
      render :new
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
  
end
