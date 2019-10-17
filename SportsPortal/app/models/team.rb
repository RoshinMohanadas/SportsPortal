class Team < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :teammembers
end
