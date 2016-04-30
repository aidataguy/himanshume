class UsersController < ApplicationController
	before_action :set_userid, only: [:update, :edit, :show]
	before_action :require_same_user, only:[:edit, :update, :destroy]
	before_action :require_admin, only:[:destroy]



	def index
		@users = User.all
	end

	def new
		not_found
		# @user = User.new
	end

	def create
		not_found
		# @user = User.new(user_params)
		# 	if @user.save
		# 		session[:user_id] = @user.id 
		# 		flash[:success] = "New User Created"
		# 		redirect_to user_path(@user)
		# 	else
		# 		render 'new'
		# 	end
	end

	def edit

	end

	def update 
		if @user.update(user_params)
			flash[:success] = "User data successfully updated"
			redirect_to user_path(@user)
		else
			redirect_to 'edit'
		end
	end 

	def show
	end 

	def destroy
		@user.destroy
		flash[:danger] = "User and Associated Article(s) destroyed successfully"
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :email)
	end

	def require_same_user
		if current_user != @user
			flash[:danger] = "you can only edit your own account"
		redirect_to root_path
		end
	end
	
	def set_userid
		@user = User.find(params[:id])
	end

	def require_admin
		if logged_in? && !current_user.admin?
			flash[:danger] = "Only Admin is supposed to do that "
		redirect_to root_path
		end
	end
	
end