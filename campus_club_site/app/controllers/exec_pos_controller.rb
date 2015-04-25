class ExecPosController < ApplicationController
	#this page will only be accessible to the user who is an admin which is just me and patrick. 
	def new#code below may actually belong inside of the eboard controller
		@execPo = ExecPo.new #object used in form
	end

	def show
			
	end


	def create
		@exec = ExecPo.new(execPo_params)
		if @exec.save
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

	def execPo_params
		params.require(:exec_po).permit(:position)
	end

end
