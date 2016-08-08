class Token < ApplicationRecord
  belongs_to :estate

  before_create :asignar_token

	def self.authenticate(auth_token)
		find_by(token: auth_token)
	end

	private

	def asignar_token
		self.token = SecureRandom.uuid
	end
end
