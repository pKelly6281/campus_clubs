class EboardsController < ApplicationController
  def show
    #shows the eboard individual page
    @eboard = Eboard.find(params[:id])
    @user = current_user

  end

  def new
    @eboard = Eboard.new
    @user_options = User.all.map{|u| [ u.firstname + " " + u.lastname, u.id ] }
    @execPo_options = ExecPo.all.map{|e| [e.position, e.id]}
    @exePostion_options = Array.new

    @club_options = Club.find(params[:id])
    @club = @club_options
    @isThere = false;
    @execPo_options.each do |e|
          if !(@club.eboards.where("exec_po_id ="+e[1].to_s).exists?)
              @exePo = ExecPo.find(e[1])
              @temp = Array.new
              @temp.push(@exePo.position, @exePo.id)
              @exePostion_options.push(@temp)
              @isThere = true
          end
    end
    if !(@isThere)
      flash[:danger] = "There are no new positions to add"
      redirect_to @club
    end

    @creator = User.find(@club.user_id)
    @user = current_user

    @currentEboardMembers = @club.eboards

    # if !(logged_in? && (@creator.id == @user.id || @eboard.where("user_id="+@user.id.to_s).exists?))
    #  flash[:danger] = "You cannot add new Executive Members to this club"
    #  redirect_to @club
    #end

    #code above is not working 
  
  end

  def create
    @eboard = Eboard.new(eboard_params)
    if @eboard.save
      @club = Club.find(@eboard.club_id)
      @club.updated_at = Time.now
      @club.save
      redirect_to @club
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
    @club = Club.find(@eboard.club_id)
    if @eboard.update_attributes(eboard_params)
      flash[:success] = "Executive Board has been updated."
      @club.updated_at = Time.now
      @club.save
      redirect_to @club
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

