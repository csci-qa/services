#specs for mylist.rb
require 'rspec'
require 'json'
require 'rest-client'

describe 'my todo list' do
  it 'is a list of todo items that can be added or deleted'

    #add first item to my_list_items
    response = RestClient.get 'localhost:4567/my_list_items', :accept => :json
    the_list = JSON.parse(response, :symbolize_names => true)
    first_item = 'Dust the living room'
    RestClient.post 'localhost:4567/my_list_items', :data => first_item.to_json, :accept => :json

    #second item
    second_item = 'Shovel the driveway'
    RestClient.post 'localhost:4567/my_list_items', :data => second_item.to_json, :accept => :json

    #third item
    third_item = 'Clean out car'
    RestClient.post 'localhost:4567/my_list_items', :data => third_item.to_json, :accept => :json

    #delete item from list
    RestClient.delete 'localhost:4567/my_list_items', :accept => to_json
end
