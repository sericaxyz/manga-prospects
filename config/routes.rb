Rails.application.routes.draw do
  get 'materials/new'
  get 'sessions/new'
  get 'users/new'
    root 'pages#index'
    get 'pages/help'
    get 'pages/aboutus'
    
#管理者へのメッセージに対応

    get 'inquiry' => 'inquiry#index'            #入力画面
    post 'inquiry/confirm' => 'inquiry#confirm' #確認画面
    post 'inquiry/thanks' => 'inquiry#thanks'   #通信完了画面

#ユーザー登録フォームに対応
  
    get 'signup', to: 'users#new'
    # resources :users, only: [:index, :show, :create, :edit, :update]

#サインインとセッション関連

    get '/login', to: 'sessions#new' 
    post '/login', to: 'sessions#create' 
    delete '/logout', to: 'sessions#destroy'
    
#素材投稿関連

  resources :users
  resources :materials

#『いいね』関連

    get 'favorites/index' 
    post '/favorites', to: 'favorites#create'
    post '/destroy', to: 'favorites#destroy'

end