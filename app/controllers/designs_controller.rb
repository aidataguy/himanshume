class DesignsController < ApplicationController
before_action :set_id, only: [:edit, :update, :show]
	def index
		@designs = Design.all
	end

	def new
		if logged_in?
			@design = Design.new
		else
			flash[:danger] = "umm... You must be logged in to do this"
			redirect_to login_path
		end
	end

	def create
		@design = Design.new(design_params)
		if @design.save
	 		flash[:success] = "Design Created Successfully"
	 		redirect_to design_path(@design)
	 	else
	 		render 'new'
	 	end
	end

	def show
		
	end

	def update
		if @design.update(design_params)
			flash[:success] = "Design Updated awesomely!"
			redirect_to design_path(@design)
			else
				render 'edit'
			end
	end

	private
	def set_id
		@design = Design.friendly.find(params[:id])
	end
	def design_params
		params.require(:design).permit(:name, :design_description, :url, :id)
	end

end