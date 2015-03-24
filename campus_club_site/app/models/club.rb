class Club < ActiveRecord::Base
	#validate club variables 
	validates :name, presence: true, length: { maximum: 50}
	validates :desc, presence: true, length: { maximum: 150}
	validates :meetTime, presence: true, length: { maximum: 30}
	validates :meetLoc, presence: true, length: { maximum: 30}



end
