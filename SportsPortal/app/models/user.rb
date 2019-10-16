class User < ApplicationRecord
    
  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true
  validates :contactNo, presence: true
  validates :name, presence: true

end
