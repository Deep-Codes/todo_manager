class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.due_today
    all.where("due_date = ? ", Date.today).order({ created_at: :desc })
  end

  def self.due_later
    all.where("due_date > ? ", Date.today).order({ created_at: :desc })
  end

  def self.overdue
    all.where("due_date < ? and completed = ? ", Date.today, false).order({ created_at: :desc })
  end

  def self.is_completed
    all.where("completed = ? ", true)
  end
end
