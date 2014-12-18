class Photo < ActiveRecord::Base
  has_attached_file :image_file
end
