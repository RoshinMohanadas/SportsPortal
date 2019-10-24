class Image < ApplicationRecord
    validates :photo, presence: true
    has_one_attached :photo
end
