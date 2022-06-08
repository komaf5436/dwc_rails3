Rails.application.routes.draw do
  devise_for :users
  # root to:と記述することで、/にアクセスした場合、自分の作成したページに設定することが出来る。
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
