class DogsController < ApplicationController
	before_action :require_login, except: [:index]
	# before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@dogs = Dog.all
	end

	def show
		@dog = Dog.find_by(id: params[:id])
	end

	def new
		@dog = Dog.new
		@dog.build_image
	end

	def edit
		@dog = Dog.find_by(id: params[:id])
	end

	def update
		@dog = Dog.find_by(id: params[:id])
		@dog.update(dog_params)
		redirect_to dog_path(@dog)
	end

	def create
		@dog = Dog.create(dog_params)
		redirect_to dog_path(@dog)
	end

	def destroy
		@dog = Dog.find_by(id: params[:id])
		@dog.destroy
		redirect_to dogs_path
	end


	private

	def dog_params
		params.require(:dog).permit(:name, :age, :breed_id, image_attributes: [:url])
	end

end
