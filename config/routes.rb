Rails.application.routes.draw do
  devise_for :users #デバイスを使用する際にURLにユーザーズを含むことを示しているよ！
  root 'post_images#index' #投稿画面の一覧画面に飛ぶよ！
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
