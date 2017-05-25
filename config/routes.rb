Rails.application.routes.draw do

  resources :products
  resources :projects
  resources :accounts
  devise_for :users, controllers: {
      registrations: 'users/registrations'
    }

    root 'accounts#index'

  # namespace :html_pdf_converter, as: '' do
  #
  # end
  get '/pdf_converter/:id', to: 'html_pdf_converter#pdf_layout', as: 'pdf_view'
  post '/pdf_converter/generate', to: 'html_pdf_converter#generate', as: 'pdf_generate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
