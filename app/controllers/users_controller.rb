class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      redirect_to root_url subdomain: 'blog'
  	else
  		render 'edit'
  	end
  end

  private
    def user_params
    	params.require(:user).permit(:name, :email, :password,
    		                           :password_confirmation)
    end
end
