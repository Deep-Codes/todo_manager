class Todo < ActiveRecord::Base
  def to_beautiful_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date} #{todo_text} #{is_completed}"
  end
end
