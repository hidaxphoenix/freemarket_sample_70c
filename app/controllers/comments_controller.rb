class CommentsController < ApplicationController
  
  def create
    # binding.pry
    # 下記記述不要
    # @comment = Comment.create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to item_path(comment.item.id), notice:'コメントされました。'
    else 
      render :show, notice:'コメントの送信に失敗しました。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
