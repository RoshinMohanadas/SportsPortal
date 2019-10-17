class User < ApplicationRecord
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
	validates :email,  presence: true, length: { maximum: 225 },
					   format: { with: VALID_EMAIL_REGEX },
					   uniqueness: { case_sensitive: false }
	validates :contactno,  presence: true, length: { minimum: 10,maximum: 10 }
	#validates :designation,  presence: true
    has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
