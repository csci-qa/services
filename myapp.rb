require 'sinatra'
require 'json'

todo_list = ['feed the dogs', 'mow the lawn', 'mop the floors']

get '/todo_list' do
  todo_list.to_json
end

post '/todo_list' do
  list_item = params[:data]
  todo_list << params[:data]
  list_item.to_json
end

delete '/todo/:index' do
  list.delete_at(params[:index].to_i)
end