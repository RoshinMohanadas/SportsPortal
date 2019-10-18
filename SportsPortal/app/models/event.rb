class Event < ApplicationRecord
  belongs_to :eventgroup
  has_many :teams
  has_many :matches
  has_one_attached :rulesfile
end
