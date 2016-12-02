require 'json'
require 'rest-client'

describe 'the todo services' do
  it 'can track items in a list' do
    response = RestClient.get 'http://localhost:4567/todo', :accept => :json
    list_a = JSON.parse(response,:symbolize_names => true)
    todo_item = 'mow lawn'
    RestClient.post 'http://localhost:4567/todo',
                               :data => todo_item.to_json,
                               :accept => :json
    todo_item = 'rake leaves'
    RestClient.post 'http://localhost:4567/todo',
                    :data => todo_item.to_json,
                    :accept => :json
    todo_item = 'clean gutters'
    RestClient.post 'http://localhost:4567/todo',
                    :data => todo_item.to_json,
                    :accept => :json

    response = RestClient.get 'http://localhost:4567/todo', :accept => :json
    list_b = JSON.parse(response,:symbolize_names => true)
    expect(list_b.size).to eq (list_a.size+3)

    RestClient.delete 'http://localhost:4567/todo/2', :accept => :json

    response = RestClient.get 'http://localhost:4567/todo', :accept => :json

    list_c = JSON.parse(response,:symbolize_names => true)

    expect(list_c.size).to eq (list_b.size-1)
    expect(list_c).not_to include 'clean gutters'


  end


end




