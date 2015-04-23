class HomeController < ApplicationController
  def home
      @home = Club.paginate(page: params[:page], :per_page => 10) #@home contains the Club db data
      
  end
  def signup
  end


  def login
  end

  def about
  end
  def view
  end
  def requests
  end
end
