class Eboard < ActiveRecord::Base
	#before saving conditions?
	#sbefore_save {self.name = name.downcase}
	#validate eboard variables 
	validates :president, presence: true, length: { maximum: 50}
	validates :vice_president, presence: true, length: { maximum: 50}
	validates :secretary, presence: true, length: { maximum: 50}
	validates :treasurer, presence: true, length: { maximum: 50}

	def eboard_params
      params.require(:eboard).permit(:president, :vice_president, :secretary,
                                   :treasurer)
  	end

end
