class User < ActiveRecord::Base

  has_many :eboards
  has_many :clubs, through: :eboards
  has_many :exec_pos, through: :eboards
  #db association 
  has_and_belongs_to_many :clubs
  attr_accessor :remember_token
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
	def authenticated?(attribute, token)
  		digest = send("#{attribute}_digest")
    	return false if digest.nil?
    	BCrypt::Password.new(digest).is_password?(token)
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
end
