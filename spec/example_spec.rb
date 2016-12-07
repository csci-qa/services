require 'rest-client'
require 'JSON'

describe 'the todo list' do


  it 'gets the list, adds to the list, and deletes from the list' do
    list_0 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    RestClient.post 'http://localhost:4567/todo', :data => 'mow lawn', :accept => :json, :symbolize_names =>true
    list_1 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    expect(list_1.size).to eq (list_0.size + 1)
    expect(list_1.last).to eq 'mow lawn'
    list_2 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    RestClient.post 'http://localhost:4567/todo', :data => 'laundry', :accept => :json, :symbolize_names =>true
    list_3 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    expect(list_3.size).to eq (list_2.size + 1)
    expect(list_3.last).to eq 'laundry'
    list_4 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    RestClient.post 'http://localhost:4567/todo', :data => 'dishes', :accept => :json, :symbolize_names =>true
    list_5 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    expect(list_5.size).to eq (list_4.size + 1)
    expect(list_5.last).to eq 'dishes'
    list_6 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    RestClient.delete 'http://localhost:4567/todo/2', :accept => :json, :symbolize_names =>true
    list_7 = JSON.parse(RestClient.get 'http://localhost:4567/todo', :accept => :json, :symbolize_names =>true)
    expect(list_7.size).to eq (list_6.size - 1)
    expect(list_7.last).to eq 'laundry'
  end
end





