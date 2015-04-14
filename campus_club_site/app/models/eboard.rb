class Eboard < ActiveRecord::Base
	
	belongs_to :clubs
	belongs_to :users
	belongs_to :executive_positions

end
