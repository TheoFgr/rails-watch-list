Rails.application.routes.draw do
  resources :lists, except: [:destroy, :edit, :update] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
