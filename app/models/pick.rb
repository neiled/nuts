class Pick < ActiveRecord::Base
  belongs_to :talent
  belongs_to :breakdown
end
