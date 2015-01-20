class Pick < ActiveRecord::Base
  belongs_to :talent
  belongs_to :breakdown
  has_and_belongs_to_many :photos
end
