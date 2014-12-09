require "test_helper"

class BreakdownTest < ActiveSupport::TestCase

  def breakdown
    @breakdown ||= Breakdown.new
  end

  def test_valid
    assert breakdown.valid?
  end

end
