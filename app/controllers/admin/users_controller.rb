class Admin::UsersController < ApplicationController

 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "El usuario ha sido creado" }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar )
  end

 

end
