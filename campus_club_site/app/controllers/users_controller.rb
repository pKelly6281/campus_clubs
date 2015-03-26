class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def requests
  end

  def yourclubs
    @users = Club.paginate(page: params[:page]) #@users contains the Club db data
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
