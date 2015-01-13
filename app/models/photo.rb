class Photo < ActiveRecord::Base
  belongs_to :talent

  has_attached_file :image_file, :styles => { :thumb => ["150x150#", :png] }
  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def url(style = nil)
    image_file.url(style)
  end

end
