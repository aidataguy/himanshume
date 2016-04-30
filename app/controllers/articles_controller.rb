class ArticlesController < ApplicationController
	before_action :set_id, only: [:edit, :update, :show]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update]
	before_action :article_users, only: [:index, :show]
	def index
	  	@articles = Article.search(params[:search])
	end

	def new
		@article = Article.new
	end

	def edit
	end 

	def create
	@article = Article.new(article_params)	
	@article.user = current_user
		if @article.save
		 		flash[:success] = "Article Created successfully"
		 		redirect_to article_path(@article)
		 	else
		 		render 'new'
		 	end
	end

	def update
			if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
			else
				render 'edit'
			end
	end

	def show
	end

	def destroy
	end


	private 
	def set_id
		@article = Article.friendly.find(params[:id])
	end

	def require_same_user
		if current_user != @article.user 
			flash[:danger] = "You cannot delete/edit this article article"
			redirect_to root_path
		end
	end

	def article_params
		params.require(:article).permit(:title, :description, :excerpt, category_ids: [])
	end

	def article_users
	  	@user = User.all
	end

end