Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do
   root to:  "homes#top"
   resources :homes, only: [:top, :about]
   resources :customers, only: [:index, :show, :edit, :update] do
    get "unsubscribe"
    patch "withdrawal"
  end
   resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
       resource :likes, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
   end
   resources :categorys, only: [:index, :edit, :create, :update]
 end

  namespace :admin do
    root to:"customers#index"
    resources :homes, only: [:top]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
     resources :comments, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :categorys, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
