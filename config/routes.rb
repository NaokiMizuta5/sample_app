Rails.application.routes.draw do
  
  # get 'homes/top'はget 'homes/top' => 'homes#top'の省略形
  # すなわちパスhomes/topにアクセスするとコントローラーHomesのtopアクションが行われる
  get '/top' => 'homes#top'
  # get 'lists/new'
  # post 'lists' => 'lists#create'
  # get 'lists' => 'lists#index'
  # # :id はlists/:id = lists/1 とかlists/2に該当
  # get 'lists/:id' => 'lists#show', as: 'list'
  # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  # patch 'lists/:id' => 'lists#update', as: 'update_list'
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
  resources :lists
  # コメントアウトした部分は一般的なので上の一行で自動生成される

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
