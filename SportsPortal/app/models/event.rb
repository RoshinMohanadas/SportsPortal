class Event < ApplicationRecord
  belongs_to :eventgroup
  has_many :teams, dependent: :delete_all
  has_many :matches, dependent: :delete_all
  has_one_attached :rulesfile, dependent: :delete_all
  has_one_attached :accomodation
end
