Rails.application.routes.draw do
  get 'pages/home'          => 'pages#home', as: :home
  post 'pages#import_file'  => 'imports#import_cnab_file', as: :import_cnab_file

  root 'pages#home'
end
