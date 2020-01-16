class User < ApplicationRecord
	has_one_attached :avatar
    #has_many :leaves,foreign_key: 'eid', primary_key: 'eid'
	# before_save { self.eid = eid.downcase }
	#before_save { eid.downcase! }
	before_save { email.downcase! }
	# before_save { self.email = email.downcase }
	#validates :eid,  presence: true, length: { maximum: 10 },
	#				 uniqueness: { case_sensitive: false }
	#validates :ename,  presence: true, length: { maximum: 50 }
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, :allow_blank => true,length: { maximum: 225 },
					   format: { with: VALID_EMAIL_REGEX },
					   uniqueness: { case_sensitive: false }
	validates :contactno,  :allow_blank => true, length: { maximum: 10 }
	#validates :designation,  presence: true
    has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_many :teams, dependent: :delete_all
	belongs_to :institute, optional: true
end
