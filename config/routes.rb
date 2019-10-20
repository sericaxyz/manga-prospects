Rails.application.routes.draw do
    root 'pages#index'
    get 'pages/help'
    get 'pages/aboutus'
    
# 以下、「Ruby on Rails 4 でお問い合わせフォーム」対応

    get 'inquiry' => 'inquiry#index'            #入力画面
    post 'inquiry/confirm' => 'inquiry#confirm' #確認画面
    post 'inquiry/thanks' => 'inquiry#thanks'   #通信完了画面

end