Rails.application.routes.draw do
  resources :change_agents
  devise_for :admins
  resources :quotes
  resources :partners
  resources :team_members
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :screenings

  scope '/playlist' do
    resources :tracks
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "pages#show", page: 'landing'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'c10' => 'pages#show', page: 'c10'
  get 'moving-forward/:page' => 'moving_forward#show'
  get 'playlist' => 'tracks#index'
  get 'nd_playlist' => 'tracks#index', location: "ND"


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
