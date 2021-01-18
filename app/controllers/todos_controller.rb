class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_beautiful_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_beautiful_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    render plain: "Hey your new Todo is Created with the id : #{new_todo[:id]}"
  end
end
