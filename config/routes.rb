Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

 scope module: :public do
   root to:  "homes#top"
   resources :homes, only: [:top, :about]
   resources :customers, only: [:index, :show, :edit, :update] do
    get "unsubscribe"
    patch "withdrawal"
    member do
        get :likes
    end
    resource :relationships, only: [:create, :destroy] do
        collection do
            get 'followings' => 'relationships#followings', as: 'followings'
            get 'followers' => 'relationships#followers', as: 'followers'
        end
    end
  end
   resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
       resource :likes, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
   end
   resources :categorys, only: [:index, :edit, :create, :update, :destroy]
   resources :chats, only: [:show, :create]
   resources :notifications, only: [:index]
 end

  namespace :admin do
    root to:"customers#index"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :update, :destroy] do
     resources :comments, only: [:index, :show, :edit, :update, :destroy]
     collection do
       get 'search'
      end
    end
    resources :categorys, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
