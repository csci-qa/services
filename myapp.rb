require 'sinatra'
require 'json'


todo_list = ['do the laundry', 'sweep the floors']

get '/todo_list' do
  todo_list.to_json
end

post '/todo_list' do
  todo_item = params[:data]
  todo_list << todo_item
  todo_item.to_json
end

delete '/todo_list/:n' do
  todo_list.delete_at(params[:n].to_i)
end



