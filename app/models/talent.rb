class Talent < ActiveRecord::Base
  has_many :photos
  has_many :picks

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def bookings
    self.picks ? self.picks.booked : []

  end


end
