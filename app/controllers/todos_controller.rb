class TodosController < ApplicationController
  def index
    @todos = Todo.of_user(current_user)
    render "index"
  end

  # Saves Todo Based on ActiveRecord Validation from Todo.rb
  # if done => /todos for refresh
  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.new(todo_text: todo_text, due_date: due_date, completed: false, user_id: current_user.id)
    new_todo.save
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(" , ")
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    complete = todo.completed
    todo.completed = !complete
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
