require 'sinatra'
require 'json'

enable :sessions
list = ['paint the barn', 'water the corn', 'feed the hogs', 'fix the car']
get '/todos' do
  content_type :json
  list.to_json
end

post '/todos' do
  content_type :json
  list << params[:data]
  list.to_json
end

delete '/todos/:index' do
  content_type :json
  list.delete_at(params[:index].to_i)
  list.to_json
end