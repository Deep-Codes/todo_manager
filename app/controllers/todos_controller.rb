class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.all.map { |todo| todo.to_beautiful_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_beautiful_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    # render plain: "Hey your new Todo is Created with the id : #{new_todo[:id]}"
    redirect_to todos_path
  end

  def update
    id = params[:id]
    todo = Todo.find(id)
    complete = todo.completed
    todo.completed = !complete
    todo.save!
    # render plain: "Todo with id: #{id} is set to #{!complete}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
