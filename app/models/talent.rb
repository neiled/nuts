class Talent < ActiveRecord::Base
  has_many :photos
  belongs_to :picks

  def age
    return 'Unknown' unless date_of_birth
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end



end
