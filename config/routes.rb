Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :users
  # root to:と記述することで、/にアクセスした場合、自分の作成したページに設定することが出来る。
  root to: "homes#top"
  
  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能。
  # onlyオプションを使用することで、生成するルーティングを限定してくれる。
  # 今回の場合、new,create,index,showのアクション以外は、ルーティングは行われない。
  resources :post_images, only:[:new, :create, :index, :show, :destroy]
  
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
