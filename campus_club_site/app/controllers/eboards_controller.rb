class EboardsController < ApplicationController
  def show
    #shows the eboard individual page
    @eboard = Eboard.find(params[:id])
    @user = current_user
  end

  def new
    if logged_in?
      @user_options = User.all.map{|u| [ u.firstname + " " + u.lastname, u.id ] }
      
      @eboard = Eboard.new
      @execPos = ExecPo.all #object used to show all executive positions for the eboard

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
  end

  def update
    @eboard = Eboard.find(params[:id])
    if @eboard.update_attributes(eboard_params)
      flash[:success] = "Executive Board has been updated. Notifications have been sent to the E-board members"
      redirect_to @eboard
    else
      render 'edit'
    end
  end 

  private
  
  def eboard_params
      params.require(:eboard).permit(:user_id, :club_id, :exec_po_id)
  end


end

