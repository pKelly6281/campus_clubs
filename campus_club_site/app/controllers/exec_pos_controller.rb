class ExecPosController < ApplicationController
	
	def new
		@execPo = ExecPo.new
		@user = current_user
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
