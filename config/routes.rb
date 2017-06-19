Rails.application.routes.draw do
  # if no or invalid subdomain name present
  constraints(SubdomainRoutes) do
    resources :blogs, only: [:new]
    root 'welcome#index'
  end

  # if valid subdomain name present
  constraints(!SubdomainRoutes) do
    resources :blogs, except: [:index, :new] do
      resources :posts
    end
    root 'blogs#show'
  end
end

