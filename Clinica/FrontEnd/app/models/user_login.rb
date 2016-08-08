class UserLogin < ApplicationRecord
	has_secure_password

	validates :name, presence: true, length: 4..30
	validates :last_name, presence: true, length: 4..30
	validates :user_name, presence: true, length: 4..10
	validates :email, format: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
	#validates :password, format: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\Z/
end
