class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(role: 1)
    end
  end
  
  def new
  end

  def show
    # @jobs = current_user.jobs
    if current_user.admin?
      @user = User.find(params[:id])
      @postings = @user.recruiter_postings
      @jobs = Job.where(user_id: @user.id)
    else
      @user = current_user
      @postings = @user.recruiter_postings
      @jobs = Job.where(user_id: current_user.id)
    end
  end

  def edit
    # @user = current_user
  end

  def updated
    if current_user.admin?
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to current_user, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: current_user }
        else
          format.html { render :edit }
          format.json { render json: current_user.errors, status: :unprocessable_entity }
        end
      end
    else
      @user = current_user
      respond_to do |format|
        if current_user.update(user_params)
          format.html { redirect_to current_user, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: current_user }
        else
          format.html { render :edit }
          format.json { render json: current_user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to users_path, notice: "User deleted."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :vendor, :url)
  end 
end
