class EboardsController < ApplicationController
  def show
    #shows the eboard individual page
    @eboard = Eboard.find(params[:id])
    @user = current_user
  end

  def new
    if logged_in?
      @user_options = User.all.map{|u| [ u.firstname + " " + u.lastname, u.id ] }
      @execPo_options = ExecPo.all.map{|e| [e.position, e.id]}
      @current_club = Club.find(params[:id])

      #needs to gather the positions that are not already taken
      ##look at the current club
      ###check if that club has eboard tables
      ####check what the eboard table consists of and only show what it does not have
      @currentEboardMembers = @current_club.eboards

    

      @eboard = Eboard.new
    else
      redirect_to root_url
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
    if logged_in?
      @club = Club.find(params[:id])
      @eboard = Eboard.where("club_id = "+@club.id.to_s)
    else
      redirect_to root_url
    end
  end
  private
  
  def eboard_params
      params.require(:eboard).permit(:user_id, :club_id, :exec_po_id)
  end


end

