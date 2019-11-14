class FavoritesController < ApplicationController
  def index
    @favorite_materials = current_user.favorite_materials
  end

  def create
    
    if current_user.nil?
      redirect_to materials_path, danger: 'ログインしてください。'
    
    else
    
      favorite = Favorite.new
      favorite.user_id = current_user.id
      
      favorite.material_id = params[:material_id]

      if favorite.save
        redirect_to materials_path, success: 'お気に入りに登録しました'
      else
        redirect_to materials_path, danger: 'お気に入りに登録に失敗しました'
      end    
    end
  end
  
    # favorite = Favorite.new
    # favorite.user_id = current_user.id
    # favorite.material_id = params[:material_id]

    # if favorite.save
    #   redirect_to materials_path, success: 'お気に入りに登録しました'
    # else
    #   redirect_to materials_path, danger: 'お気に入りに登録に失敗しました'
    # end
  # end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, material_id: params[:material_id])
    favorite.destroy
    redirect_to materials_path, success: 'お気に入りを解除しました'
  end
  
end