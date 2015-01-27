module TalentHelper

  def get_profile_picture(talent, style=:thumb)
    talent.photos.any? ? "<img src=\"#{talent.photos.first.url(style)}\">" : '<img data-src="holder.js/150x150">'
  end
end
