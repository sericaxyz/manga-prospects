class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
  @user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
 
    if @user.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  # def show
  #   @user = User.find(params[:id])
  # end
  
  private

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
