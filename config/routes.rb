Rails.application.routes.draw do
  # devise gemで作成されたdevise_for :usersは、多くのroutingを自動で作成してくれている。
  # devise gemが備えている機能を書き換えるために、
  # devise gemが持っているDevis::RegistrationsControllerを継承したクラス 
  # Users::RegistrationsControllerを作成し、それの内容を記述することで上書きしたので、
  # routesにも、controllerを追記する 
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get '/users/sign_in' => 'devise/sessions#new' これはdeviseディレクトリの中のsessionsコントローラーのnewアクションへ渡している
  # post '/users/sign_in' => 'devise/sessions#create'
  # delete '/users/sign_out' => 'devise/sessions#destroy'
  # post '/users/password' => 'devise/passwords#create'
  # get '/users/password/new' => 'devise/passwords#new'
  # get '/users/password/edit' => 'devise/passwords#edit'
  # patch '/users/password' => 'devise/passwords#update'
  # put '/users/password' => 'devise/passwords#update'
  # get '/users/cancel' => 'devise/registrations#cancel'
  # post '/users' => 'devise/registrations#create'
  # get '/users/sign_up' => 'devise/registrations#new'
  # get '/users/edit' => 'devise/registrations#edit'
  # patch '/users' => 'devise/registrations#update'
  # put '/users' => 'devise/registrations#update'
  # delete '/users' => 'devise/registrations#destroy'
  
  # profileのrouteを記述する際に、users/:user_id/profile などのurlで
  # アクセスできるようにするためにnest化する。
  # 各userは1つしかprofileを持たないので、resource :profile は単数形になっている。
  # resourcesではなく、resourceと単数形で記述すると、
  # create new edit show update destroyの6つのroutingを自動で行なってくれる。
  # resourcesと記述する時と違い、profiles/:id へのアクセスに対するroutingは行われない。
  # userは1つしかprofileを持たないため、idでprofileを指定する必要が無いから。
  # post '/users/:user_id/profile' => 'profiles#create'
  # get '/users/:user_id/profile/new' => 'profiles#new'
  # get '/users/:user_id/profile/edit' => 'profiles#edit'
  # get '/users/:user_id/profile' => 'profiles#show'
  # patch '/users/:user_id/profile' => 'profiles#update'
  # put '/users/:user_id/profile' => 'profiles#update'
  # delete '/users/:user_id/profile' => 'profiles#destroy'
  resources :users do
    resource :profile
  end
  
  # resourcesを使ったroutingは、index create new edit show update destroyの７つのroutingを自動で行なってくれる
  resources :contacts 
  # get '/contacts' => 'contacts#index' => 'contacts_path'
  # post '/contacts' => 'contacts#create'
  # get '/contacts/new' => 'contacts#new' => 'new_contact_path'
  # get '/contacts/:id/edit' => 'contacts#edit' => 'edit_contact_path'
  # get '/contacts/:id' => 'contacts#show' => 'contact_path'
  # patch '/contacts/:id' => 'contacts#update'
  # put '/contacts/:id' => 'contacts#update'
  # delete '/contacts/:id' => 'contacts#destroy'
  get '/about' => 'pages#about'
  root 'pages#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
