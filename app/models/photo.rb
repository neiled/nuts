class Photo < ActiveRecord::Base
  belongs_to :talent
  has_and_belongs_to_many :picks

  has_attached_file :image_file,
                    :styles => { :thumb => ["150x150#", :png] },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def url(style = nil)
    image_file.url(style)
  end
  
  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY'], :secret_access_key => ENV['AWS_SECRET_KEY']}
  end    

end
