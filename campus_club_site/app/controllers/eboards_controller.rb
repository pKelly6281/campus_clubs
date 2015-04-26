class EboardsController < ApplicationController
  def show
    #shows the eboard individual page
    @eboard = Eboard.find(params[:id])
    @user = current_user
  end

  def new
    @user_options = User.all.map{|u| [ u.firstname + " " + u.lastname, u.id ] }
    @execPo_options = ExecPo.all.map{|e| [e.position, e.id]}
    @club_options = Club.find(params[:id])
    @eboard = Eboard.new
    @club = @club_options
    @creator = User.find(@club.user_id)
    @user = current_user
    if !(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
      flash[:danger] = "You cannot add new Executive Members to this club"
      redirect_to @club
    end
  
  end

  def create
    @eboard = Eboard.new(eboard_params)
    if @eboard.save
      redirect_to root_url
    else
      render 'new'#show error validation 
    end   
  end

 
  def edit
    @eboard = Eboard.find(params[:id])
    @user_options = User.all.map{|u| [ u.firstname + " " + u.lastname, u.id ] }
    @execPo = ExecPo.find(@eboard.exec_po_id)
    @club = Club.find(@eboard.club_id)
    @creator = User.find(@club.user_id)
    @user = current_user
    if !(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
      flash[:danger] = "You cannot edit the Executive Members of this club"
      redirect_to @club
    end
  end

  def update
    @eboard = Eboard.find(params[:id])
    if @eboard.update_attributes(eboard_params)
      flash[:success] = "Executive Board has been updated."
      redirect_to Club.find(@eboard.club_id)
    else
      render 'edit'
    end
  end 
  def showAll
      @club = Club.find(params[:id])
      @eboard = Eboard.where("club_id = "+@club.id.to_s)
      @creator = User.find(@club.user_id)
      @user = current_user
    if !(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
      flash[:danger] = "You cannot edit the Executive Members of this club"
      redirect_to @club
    end
  end
  private
  
  def eboard_params
      params.require(:eboard).permit(:user_id, :club_id, :exec_po_id)
  end


end

