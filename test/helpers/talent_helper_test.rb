require 'test_helper'

class TalentHelperTest < ActionView::TestCase
  def talent
    Talent.new
  end

  test 'talent with no photos gets a helper placeholder' do
    assert_equal '<img data-src="holder.js/100x100">', get_profile_picture(talent)
  end

  test 'talent with one photo shows that photo' do
    t = talent
    p = Photo.new
    t.photos << p
    p.stub :url, 'test_url' do
      assert_equal '<img src="test_url">', get_profile_picture(t)
    end
  end
end
