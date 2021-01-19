class User < ApplicationRecord
  def to_beautiful_string
    "Name: #{name} Email: #{email}  Pass: #{password}"
  end
end
