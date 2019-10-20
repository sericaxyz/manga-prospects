# 以下、「Ruby on Rails 4 でお問い合わせフォーム」対応

class InquiryController < ApplicationController
  def index
    #入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'index'
  end
  
  def confirm
    #入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    # @inquiry  user = params[:user].permit(:name, :age, :country)
    if @inquiry.valid?
      #OK, 確認画面を表示
      render :action => 'confirm'
    else
      #NG, 入力画面を再表示
      render :action=>'index'
    end
  end

  def thanks
    #メール送信
    @inquiry = Inquiry.new(inquiry_params)
#    inquiryMailer = InquiryMailer.new
    InquiryMailer.received_email(@inquiry).deliver
  
    #完了画面を表示
    render :action => 'thanks'
  end
  
  private 
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end

