class Breakdown < ActiveRecord::Base
  belongs_to :project_id
  has_and_belongs_to_many :talents
end
