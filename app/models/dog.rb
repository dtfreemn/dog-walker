class Dog < ApplicationRecord
	belongs_to :breed
	has_one :image, dependent: :destroy
	accepts_nested_attributes_for :image
	
	# def image=(url)
	# 	image = Image.new
	# 	image.url = url
	# 	image.dog_id = self.id
	# 	image.save
	# end

end
