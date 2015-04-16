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
  def isFavorite
    @club = Club.find(params[:id])
    @user = current_user
    @isFavorite = @club.users.exists?(@user.id)
    render :json => [@isFavorite]
  end
  def unfavorite
    @club = Club.find(params[:id])
    @user = current_user
    if(@club.users.destroy(@user.id))
      render :json => ["destoryed"]
    else
      render :json => ["not desetroyed"]
    end
  end
  def favorite
    @club = Club.find(params[:id])
    @user = current_user
    if(@club.users.push(@user))
      render :json => ["pushed"]
    else
      render :json => ["not pushed"]
    end
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
