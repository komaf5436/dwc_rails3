Rails.application.routes.draw do
  devise_for :users
  # root to:と記述することで、/にアクセスした場合、自分の作成したページに設定することが出来る。
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能。
  # onlyオプションを使用することで、生成するルーティングを限定してくれる。
  # 今回の場合、new,create,index,showのアクション以外は、ルーティングは行われない。
  resources :post_images, only:[:new, :create, :index, :show, :destroy] do
    # コメントは、投稿画像に対してコメントされるので、post_commentsは、post_imagesに結び付く。
    # 親のresourcesで指定したコントローラ名に、子のresourcesで指定したコントローラ名が続くURLが生成される。このような親子関係を「ネストする」という。
    # これにより、params[:post_image_id]でPostImageのidが取得できるようになる。
    resources :post_comments, only:[:create, :destroy]
    # 単数形にすることによって、/:idが含まれなくなる
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
