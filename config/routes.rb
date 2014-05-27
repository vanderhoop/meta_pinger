# == Route Map (Updated 2014-05-27 12:04)
#
#    root      /                  welcome#index
# success GET  /success(.:format) welcome#success
#    apps POST /apps(.:format)    apps#create
#

MetaPinger::Application.routes.draw do
  root to: 'welcome#index'
  get '/success' => 'welcome#success'
  resources :apps, :only => [:create]
end
