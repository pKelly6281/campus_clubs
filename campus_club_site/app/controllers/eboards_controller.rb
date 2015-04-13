class EboardsController < ApplicationController
  def show
    #shows the eboard individual page
    @eboard = Eboard.find(params[:id])
    @user = current_user
  end

  def new
    if logged_in?
      @eboard = Eboard.new
    else
      redirect_to root_url
    end
  end

  def create
    @eboard = Eboard.new(eboard_params)
    if @eboard.save
      render 'show'
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
      params.require(:eboard).permit(:president,:vice_president, :secretary, :treasurer)
  end

end

