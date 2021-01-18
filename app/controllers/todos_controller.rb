class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_beautiful_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_beautiful_string
  end
end
