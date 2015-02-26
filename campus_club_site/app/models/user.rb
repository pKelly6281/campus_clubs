class User < ActiveRecord::Base
	validates :firstname, presence: true, length: { maximum: 30}
	validates :lastname, presence: true, length: { maximum: 30}

	#email validation 
	validates :email, presence:true, length: { maximum: 150}
	#VALID_EMAIL_REGEX = /\a[\W+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

end
