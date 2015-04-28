class ClubsController < ApplicationController
  def show
    #shows the clubs individual page
    @club = Club.find(params[:id])
    @user = current_user
    @creator = User.find(@club.user_id)
    @eboard = Eboard.where("club_id="+@club.id.to_s)
    @isThere = false
    @execPos = ExecPo.all.map{|e| [e.position, e.id]}
    @currentEboardMembers = @club.eboards

    if(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
      @showTools = true
      @execPos.each do |e|
          if !(@club.eboards.where("exec_po_id ="+e[1].to_s).exists?)
              @isThere = true
              break
          end
    end

    else
      @showTools = false;
    end
  end

  def edit
    @club = Club.find(params[:id])
    @user = current_user
    @creator = User.find(@club.user_id)
    @eboard = Eboard.where("club_id="+@club.id.to_s)

    if !(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
      flash[:danger] = "You cannot edit this club"
      redirect_to @club
    end
  end

  def new
  	if logged_in?
      @club = Club.new
      @user = current_user
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
      redirect_to @club
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
      params.require(:club).permit(:name,:desc, :meetTime, :meetLoc, :user_id)
    end
end
