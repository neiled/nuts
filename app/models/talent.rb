class Talent < ActiveRecord::Base
  has_many :photos
  has_many :picks

  def age
    return 'Unknown' unless date_of_birth
    now = Time.now.utc.to_date
    age = now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
    age < 1 ? distance_of_time_in_words(date_of_birth, Time.now) : age
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def bookings
    self.picks ? self.picks.booked : []

  end


end
