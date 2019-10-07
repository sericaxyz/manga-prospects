Rails.application.routes.draw do
    root 'pages#index'
    get 'pages/help'
    get 'pages/aboutus'
end