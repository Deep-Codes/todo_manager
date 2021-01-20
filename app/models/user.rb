class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :todos

  def to_beautiful_string
    "Name: #{name} Email: #{email}  Pass: #{password}"
  end
end
