class Pin < ApplicationRecord
	belongs_to :user
	has_one_attached :image


	validate :image_type
	validates :title, :description, presence: true

	private

		def image_type
			if image.attached? == false
     			errors.add(:image, "is missing!")
   		end
   			if image.attached? == true
   				if !image.content_type.in?(%('image/jpeg image/png'))
     				errors.add(:image, "needs to be a jpeg or png!")
     		end 
   		end
	end
end
