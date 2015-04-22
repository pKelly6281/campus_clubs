class Eboard < ActiveRecord::Base
	belongs_to :user
	belongs_to :club
	belongs_to :exec_po
end
