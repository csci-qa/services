require 'rest-client'
require 'json'


describe 'gets the list' do
  it 'has a basic GET service I can call' do
    response = RestClient.get 'http://localhost:4567/todos', :accept => :json
    content = JSON.parse(response,:symbolize_names => true)
    expect(content.size).to eq 4
  end
end

describe 'adds stuff to the list' do
  it 'has a POST service I can call' do
    response2 = RestClient.post 'http://localhost:4567/todos', :accept => :json
    content2 = JSON.parse(response2, :symbolize_names => true)
    expect(content2.size).to eq 5
  end
end

describe 'removes stuff from the list' do
  it 'has a DELETE service I can call' do
    response3 = RestClient.delete 'http://localhost:4567/todos', :accept => :json
    content3 = JSON.parse(response3, :symbolize_names => true)
    expect(content3.size).to eq 3
  end
end