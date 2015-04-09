class EboardController < ApplicationController
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
      #render 'show'
    else
      #render 'new'#show error validation 
    end   
  end

  def show
  end

  def edit
  end

  def update
  end 

  private
  def eboard_params
      params.require(:eboard).permit(:president,:vice_president, :secretary, :treasurer)
  end

end
