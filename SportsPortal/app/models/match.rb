class Match < ApplicationRecord
  belongs_to :event
  validates :description, presence: true
  validates :matchstarttime, presence: true
  validates :round, presence: true
  validates :teamone, presence: true
  validates :teamtwo, presence: true
  validates :venue, presence: true
end
