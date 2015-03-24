class ClubsController < ApplicationController
  def view
  end

  def edit
  end

  def new
  	if logged_in?
      @club = Club.new
  	else
  		redirect_to root_url
  	end
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      render 'view'
    else
      render 'add'#show error validation 
    end   
  end 
  
  private
  def club_params
      params.require(:club).permit(:name,:desc, :meetTime, :meetLoc)
    end
end
