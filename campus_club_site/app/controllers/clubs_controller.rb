class ClubsController < ApplicationController
  def show
    #shows the clubs individual page
    @club = Club.find(params[:id])
    @user = current_user
  end

  def edit
    @club = Club.find(params[:id])
  end

  def new
  	if logged_in?
      @club = Club.new
  	else
  		redirect_to root_url
  	end
  end
  def people
    render :json => ['people'];
  end
  def favorite
   / @club = Club.find(params[:id])
    @user = current_user
    @club.users.push(@user.id);
    /
    render :json => ['favorite']
  end
  def unfavorite
    @club = Club.find(params[:id])
    @user = current_user
    @club.users.destroy(@user.id)
  end
  def create
    @club = Club.new(club_params)
    if @club.save
      render 'show'
    else
      render 'new'#show error validation 
    end   
  end 

  def update
    @club = Club.find(params[:id])
    if @club.update_attributes(club_params)
      flash[:success] = "Club updated"
      redirect_to @club
    else
      render 'edit'
    end
  end
  
  private
  def club_params
      params.require(:club).permit(:name,:desc, :meetTime, :meetLoc)
    end
end
