class User < ActiveRecord::Base
  	before_save { self.email = email.downcase }#runs before we execute code before

	#first name and last name validation 
	validates :firstname, presence: true, length: { maximum: 30}
	validates :lastname, presence: true, length: { maximum: 30}



	#email validation 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 150 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


    
    has_secure_password
	validates :password, length: { minimum: 6 } 	#should be password not password_confirmation 

	#has secure password links us to the password object on this line
	#creating user password confirmation. Most of our code for making secure passwords comes from the rails method below
end
