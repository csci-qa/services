

class TodoList
  attr_reader :todos

  def initialize
    @todos = Array.new
  end

  def add_todo todo_name

    todo_name = {
        name: todo_name

    }

    @todos.push todo_name
  end

  def remove_todo index
    @todos.delete_at(index)
  end

  def get_todos
    return @todos
  end

end