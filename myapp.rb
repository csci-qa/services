require 'sinatra'
require 'json'
require_relative 'lib/todo_list'
enable :sessions
todoList = TodoList.new


get '/todo' do
  # content_type :json
  todos = todoList.get_todos
  todos.to_json
end

post '/todo' do
  # content_type :json
  list_item = params[:data]
  todos = todoList.add_todo(list_item)
  todos.to_json
end

delete '/todo/:index' do
  todoList.remove_todo(params['index'].to_i)
  []
end


