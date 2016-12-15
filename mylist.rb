#get, post and delete list items
#initializes the items to be added

require 'sinatra'
require 'json'

#array of items to be added
my_list_items = ['Dust the living room', 'Shovel the driveway', 'Clean out car']

#array items to json
get '/mylist' do
  my_list_items.to_json
end

#new items to json
post '/mylist' do
  new_list_item = params[:data]
  new_list_item.to_json
end

#delete items from list
delete '/my_list_items/:list' do
  my_list_items.delete(params[:list].to_i)
end