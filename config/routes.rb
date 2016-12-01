Rails.application.routes.draw do
  	devise_for :podcasts
	# root 'welcome#index'
	# moved after authentification

	resources :podcasts, only: [:index, :show] do
	# don't forget "do"
	# create route for episodes; an episode belongs to a podcat, so it's nested under it.
		resources :episodes
	end

	# for rerouting signed in users
	authenticated :podcast do
		root 'podcasts#dashboard', as: "authenticated_root"
	end

	root 'welcome#index'
end
