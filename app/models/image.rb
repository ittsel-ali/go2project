class Image < ApplicationRecord
 	mount_uploader :file, ImageUploader
  # attr_accessible :file	
  belongs_to :project
end
