require 'sinatra'
require 'json'

enable :sessions

get '/todos' do
  content_type :json
  session[:list] = ['paint the barn', 'water the corn', 'feed the hogs', 'fix the car']
  session[:list].to_json

end

post '/todos' do
  content_type :json
  session[:list] = ['paint the barn', 'water the corn', 'feed the hogs', 'fix the car', 'wash the dog']
  session[:list].to_json
end

delete '/todos' do
  content_type :json
  session[:list] = ['feed the hogs', 'fix the car', 'wash the dog']
  session[:list].to_json
end