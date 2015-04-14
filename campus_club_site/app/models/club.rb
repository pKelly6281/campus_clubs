class Club < ActiveRecord::Base
	has_many :eboards
	has_many :users through: :eboards

	#before saving conditions?
	#sbefore_save {self.name = name.downcase}
	has_and_belongs_to_many :users
	#validate club variables 
	validates :name, presence: true, length: { maximum: 50}
	validates :desc, presence: true, length: { maximum: 150}
	validates :meetTime, presence: true, length: { maximum: 30}
	validates :meetLoc, presence: true, length: { maximum: 30}

	def club_params
      params.require(:club).permit(:name, :desc, :meetTime,
                                   :meetLoc)
  	end

end
