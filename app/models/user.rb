class User < ApplicationRecord
  has_many :todos

  def to_beautiful_string
    "Name: #{name} Email: #{email}  Pass: #{password}"
  end
end
