class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  enum role: ["user", "admin"]

  has_many :ideas

end
