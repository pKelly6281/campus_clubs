class ExecPosController < ApplicationController
	
	def new
		@execPo = ExecPo.new
		@execPos = ExecPo.all

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
