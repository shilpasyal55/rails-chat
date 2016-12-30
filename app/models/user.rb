class User < ApplicationRecord
	has_many :message
	def self.authenticate(email,password)
	user = User.find_by(email: "#{email}")
	if user && user.password == password
		return user
	else
		return false
	end
end
end
