module TalentHelper

  def get_profile_picture(talent, style=:thumb)
    talent.photos.any? ? get_thumb_image(talent.photos.first): '<img data-src="holder.js/150x150">'
  end

  def get_thumb_image(photo)
    "<img src=\"#{photo.url(:thumb)}\">" 
  end
end
