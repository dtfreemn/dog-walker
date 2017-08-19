class BreedsController < ApplicationController
	before_action :require_login, except: [:index, :show]
	# before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
	def index
		@user = User.find_by(id: session[:user_id])
		@breeds = Breed.all
	end

	def new
		@breed = Breed.new
	end

	def show
		@user = User.find_by(id: session[:user_id])
		@breed = Breed.find_by(id: params[:id])
		@dogs = Dog.where(breed: @breed)
	end

	def create
		@breed = Breed.create(breed_params)
		redirect_to breed_path(@breed)
	end

	def edit
		@breed = Breed.find_by(id: params[:id])
	end

	def update
		@breed = Breed.find_by(id: params[:id])
		@breed.update(breed_params)
		redirect_to breed_path(@breed)
	end

	def destroy
		@breed = Breed.find_by(id: params[:id])
		@breed.destroy
		redirect_to breeds_path
	end


	private

	def breed_params
		params.require(:breed).permit(:name)
	end
end
