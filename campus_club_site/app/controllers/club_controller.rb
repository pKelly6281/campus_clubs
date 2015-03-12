class ClubController < ApplicationController
  def view
  end

  def edit
  end

  def add
  	if logged_in?
      @club = Club.new
  	else
  		notLoggedIn
  	end
  end
  def create
    @user = Club.new(club_params)
  end 
  private
  def club_params
      params.require(:club).permit(:name,:desc, :meetDate, :meetTime, :pres, :vicePres, )
    end
end
