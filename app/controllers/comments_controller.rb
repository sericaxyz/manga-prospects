class CommentsController < ApplicationController

  def new
      @comment = Comment.new
      @material = Material.find_by(id: params[:material_id])
  end

  def create
      comment = Comment.new
      comment.user_id = current_user.id
      comment.material_id = params[:material_id]
      comment.content = params[:comment][:content]
  
      if comment.save
        redirect_to materials_path, success: 'コメント登録しました'
      else
        redirect_to materials_path, danger: 'コメント登録に失敗しました'
      end
      
  end
  
end