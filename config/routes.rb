Ons::Application.routes.draw do

  get "invite/create"

  root :to => "home#show"
  #match '/show' => 'home#show'

  post "/targets" => "targets#create"
  get "/targets/get_targets" => "targets#get_targets"
  get "/targets/get_matches" => "targets#get_matches"
  post "/targets/destroy" => 'targets#destroy'
  get "/targets/highlight" => "targets#highlight"

  match "/fb/callback" => "fb#callback"

  match 'sign_in' => 'sessions#create'
  match 'sign_out' => 'sessions#destroy'

  get 'about' => 'home#about', :as => :about
  get 'faq' => 'home#faq', :as => :faq
  get '/tos' => 'home#tos'
  get '/privacy_policy' => 'home#pp', :as => :pp

  match '/trialpay' => 'trialpay#proc', :as => :trialpay

  post '/invite' => 'invite#create', :as => :invite

  
scope '/admin', :module => 'admin', :as => 'admin' do

	resource :matches, :only => [] do
		get :show, :path =>'/', :as => 'show'
		put :update, :as => 'update'
	end

end

end
