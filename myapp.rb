require 'sinatra'
require 'JSON'

todo_list = Array.new

get '/todo' do
    return todo_list.to_json
end

post '/todo' do
  list_item = params[:data]
  todo_list << list_item #put list_item on todo_list
  return list_item.to_json
end

delete '/todo/:index' do
  todo_list.delete_at(params['index'].to_i)
end



