class ExecPosController < ApplicationController
	
	def new#code below may actually belong inside of the eboard controller
		@execPo = ExecPo.new #object used in form
	end

	def show
			
	end


	def create
		@exec = ExecPo.new(execPo_params)
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

	def execPo_params
		params.require(:execPo).permit(:position)
	end

end
