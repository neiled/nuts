class Breakdown < ActiveRecord::Base
  belongs_to :project_id
  has_many :picks
  has_many :talents, through: :picks
end
