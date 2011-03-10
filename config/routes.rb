Ons::Application.routes.draw do

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

get '/tos' => 'home#tos'
get '/privacy_policy' => 'home#pp', :as => :pp

match '/trialpay' => 'trialpay#process', :as => :trialpay

end
