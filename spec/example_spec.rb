require 'rest-client'

describe 'the example services' do
  it 'has a basic GET service I can call' do
    response = RestClient.get 'http://localhost:4567/another_example', :accept => :json
    content = JSON.parse(response,:symbolize_names => true)
    expect(content.size).to eq 3
    expect(content[:a]).to eq 1
  end
end