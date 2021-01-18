class User < ActiveRecord::Base
  def to_beautiful_string
    "Name: #{name} Email: #{email}  Pass: #{password}"
  end
end
