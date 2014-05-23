class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
      @user=User.new
  end

  def create
    logger.info "in create"
    @user = User.new(user_params)
    if @user.save
      logger.info "user.save is true"
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      logger.info "rendering new"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end