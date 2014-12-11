class Talent < ActiveRecord::Base
  has_and_belongs_to_many :breakdowns

  def age
    unless date_of_birth 
      return "Unknown"
    end
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end

end
