class ExecPosController < ApplicationController
	
	def new#code below may actually belong inside of the eboard controller
		@execPo = ExecPo.new #object used in form
		@execPos = ExecPo.all #object used to show all 

		#@user = current_user
		@users = User.all
	end

	def show
			
	end


	def create
		
	end

	def edit
		
	end

	def update
		
	end
	
end
