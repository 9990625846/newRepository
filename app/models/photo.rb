class Photo < ActiveRecord::Base
	belongs_to :album
	has_many :tags
	accepts_nested_attributes_for :tags
	has_attached_file :image
	validates_attachment :image,
    	content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
