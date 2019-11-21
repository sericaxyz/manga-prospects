class InquiryMailer < ActionMailer::Base
  default from: "example@example.com" #送信元アドレス
  default to: "example@example.com" #送信先アドレス
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: "manga.prospects@gmail.com", subject: 'メッセージを承りました')
  end
  
end