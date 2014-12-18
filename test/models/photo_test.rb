require "test_helper"

class PhotoTest < ActiveSupport::TestCase

  def photo
    @photo ||= Photo.new
  end

  def test_valid
    assert photo.valid?
  end

end
