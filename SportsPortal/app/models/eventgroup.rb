class Eventgroup < ApplicationRecord
    has_many :events, dependent: :delete_all
end
