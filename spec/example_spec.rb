require 'rest-client'
require 'json'


describe 'gets the list' do
  it 'has a basic GET service I can call' do
    response = RestClient.get 'http://localhost:4567/todos', :accept => :json
    list_a = JSON.parse(response, :symbolize_names => true)
    RestClient.post 'http://localhost:4567/todos', :data => 'wash the dog', :content_type => :json, :accept => :json
    response = RestClient.get 'http://localhost:4567/todos', :accept => :json
    list_b = JSON.parse(response, :symbolize_names => true)
    expect(list_b.size).to eq (list_a.size + 1)
    expect(list_b.last).to eq 'wash the dog'
    response = RestClient.delete 'http://localhost:4567/todos/3', :accept => :json
    list_c = JSON.parse(response, :symbolize_names => true)
    RestClient.delete 'http://localhost:4567/todos/3', :accept => :json
    expect(list_c.size).to eq (list_b.size - 1)
    expect(list_c.last).to eq 'feed the hogs'
  end
end
