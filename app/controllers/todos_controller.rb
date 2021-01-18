class TodosController < ApplicationController
  def index
    render plain: Todo.all.to_a.map { |todo| todo.todo_text }
  end
end
