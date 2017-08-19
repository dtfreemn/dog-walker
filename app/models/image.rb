class Image < ApplicationRecord
	belongs_to :dog

	private

	def image_params
		params.require(:image).permit(:url, :dog_id)
	end
end
