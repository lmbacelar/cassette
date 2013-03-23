Cassette::Application.routes.draw do
  resources :instruments do
    resources :measurements, shallow: true
  end
end
