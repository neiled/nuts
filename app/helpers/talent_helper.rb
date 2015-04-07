module TalentHelper

  def get_profile_picture(talent, style=:thumb)
    talent.photos.any? ? get_thumb_image(talent.photos.first): '<img data-src="holder.js/100x100">'
  end

  def get_thumb_image(photo)
    "<img src=\"#{photo.url(:thumb)}\">"
  end

  def age(talent)
    return 'Unknown' unless talent.date_of_birth
    now = Time.now.utc.to_date
    age = now.year - talent.date_of_birth.year - ((now.month > talent.date_of_birth.month || (now.month == talent.date_of_birth.month && now.day >= talent.date_of_birth.day)) ? 0 : 1)
    age < 1 ? distance_of_time_in_words(talent.date_of_birth, Time.now) : age
  end
end
