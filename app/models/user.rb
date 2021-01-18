class User < ActiveRecord::Base
  def to_beautiful_string
    "UserTableHere"
  end
end