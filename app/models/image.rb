class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :imagable, polymorphic: true
end
