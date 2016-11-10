require 'sinatra'
require 'json'

get '/example' do
  content_type :json
  result = [
      'this', 'is', 'a', 'list'
  ]
  result.to_json
end

get '/another_example' do
  content_type :json
  {a: 1, b: 2, c: 3}.to_json
end