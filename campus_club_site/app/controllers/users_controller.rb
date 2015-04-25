class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    redirect_to root_url
  end

  def index
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    redirect_to root_url
  end

  def update
  end

  def yourclubs
    if logged_in?
      @user = current_user
      @users = Club.paginate(page: params[:page], :per_page => 10) #@users contains all the clubs

      @userCreatedClubs = Club.where(user_id:@user.id)#finds all of the created clubs by the user that is logged in
      
      @userClubs = current_user.clubs

      #user eboard stuff below
      @all_user_eboards = @user.eboards##gather all of the eboard associations for this users club page
      


    end
  end
  private
    def user_params
      params.require(:user).permit(:firstname,:lastname, :email, :password, :password_confirmation)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
