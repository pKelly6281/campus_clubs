class ExecPosController < ApplicationController
	#this page will only be accessible to the user who is an admin which is just me and patrick. 
	def new#code below may actually belong inside of the eboard controller
		@execPo = ExecPo.new #object used in form
	end

	def show
			
	end


	def create
		@execPo = ExecPo.new(exec_params)
		if @execPo.save
			redirect_to root_url
		else
			render 'new'#show error validation 
		end   
	end

	def edit
		
	end

	def update
		
	end


	private

	def exec_params
		params.require(:exec_po).permit(:position)
	end

end
