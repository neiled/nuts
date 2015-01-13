require "test_helper"

class PickTest < ActiveSupport::TestCase

  def pick
    @pick ||= Pick.new
  end

  def test_valid
    assert pick.valid?
  end

end
