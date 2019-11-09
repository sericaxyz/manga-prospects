class MaterialsController < ApplicationController
  def index
    @materials = Material.order("updated_at desc")
  end
  
  def new
    @material = Material.new
  end
  
  def create
    @material = current_user.materials.new(material_params)

    if @material.save
      redirect_to materials_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def material_params
    params.require(:material).permit(:image, :description)
  end
  
end
