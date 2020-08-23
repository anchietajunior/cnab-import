Rails.application.routes.draw do
  get  'home'        => 'pages#home', as: :home
  get  'stores'      => 'pages#stores', as: :stores
  get  'stores/:id'  => 'pages#store', as: :store
  post 'import_file' => 'imports#import_cnab_file', as: :import_cnab_file

  root 'pages#home'
end
