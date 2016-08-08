class Session
	include ActiveModel::Model
	attr_accessor :user_name, :password

	def authenticate
		current_user && current_user.authenticate(password)
	end

	def current_user
		UserLogin.find_by(user_name: user_name) || UserLogin.find_by(email: user_name)
	end
end