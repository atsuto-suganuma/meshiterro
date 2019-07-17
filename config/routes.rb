Rails.application.routes.draw do
  devise_for :users #デバイスを使用する際にURLにユーザーズを含むことを示しているよ！
  root 'post_images#index' #投稿画面の一覧画面に飛ぶよ！
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #ポストイメージコントローラのうち、ニュー、クリエイト、インデックス、ショー、デストロイに関しては自動的にルーティングするよ！
      resource :favorites, only: [:create, :destroy]
  # フェイバリットコントローラのうち、クリエイトとデストロイに関しては自動的にルーティングするよ！
      resource :post_comments, only: [:create, :destroy]
  # ポストコメントコントローラのうち、クリエイトとデストロイに関しては自動的にルーティングするよ！
  # リソースが単数形なのはコントローラからアイディーのリクエストを含まないためだよ！アイディーの受け渡しが必要なければ単数形でオッケーだよ！
end
  resources :users, only: [:show, :edit, :update]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html