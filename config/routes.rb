# == Route Map (Updated 2014-01-16 22:56)
#
#     root        /                        welcome#index
#     apps GET    /apps(.:format)          apps#index
#          POST   /apps(.:format)          apps#create
#  new_app GET    /apps/new(.:format)      apps#new
# edit_app GET    /apps/:id/edit(.:format) apps#edit
#      app GET    /apps/:id(.:format)      apps#show
#          PUT    /apps/:id(.:format)      apps#update
#          DELETE /apps/:id(.:format)      apps#destroy
#

MetaPinger::Application.routes.draw do
  root to: 'welcome#index'
  get '/success' => 'welcome#success'

  resources :apps, :only => [:create]
end
