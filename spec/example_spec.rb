require 'rest-client'
require 'json'

describe 'the todo list' do
  it 'has a list i can change' do
  response = RestClient.get 'http://localhost:4567/todo_list', :accept => :json
  RestClient.post 'http://localhost:4567/todo_list', :data => 'feed the dogs', :accept => :json, :symbolize_names => true
  item_1 = JSON.parse(response, :symbolize_names => true)
  response = RestClient.get 'http://localhost:4567/todo_list', :accept => :jso
  item_2 = JSON.parse(response, :symbolize_names => true)
  expect(item_2.size).to eq (item_1.size + 1)
  expect(item_2.last).to eq 'feed the dogs'
  response = RestClient.get 'http://localhost:4567/todo_list', :accept => :json
  RestClient.post 'http://localhost:4567/todo_list', :data => 'mop the floor', :accept => :json, :symbolize_names => true
  item_3 = JSON.parse(response, :symbolize_names => true)
  response = RestClient.get 'http://localhost:4567/todo_list', :accept => :json
  item_4 = JSON.parse(response, :symbolize_names => true)
  expect(item_4.size).to eq (item_3.size + 1)
  expect(item_4.last).to eq 'mop the floor'
  RestClient.delete 'http://localhost:4567/todo_list/3', :accept => :json, :symbolize_names =>true
  item_5 = JSON.parse(RestClient.get 'http://localhost:4567/todo_list', :accept => :json, :symbolize_names =>true)
  expect(item_5.size).to eq (item_4.length - 1)
  expect(item_5.last).to eq 'feed the dogs'

end
end