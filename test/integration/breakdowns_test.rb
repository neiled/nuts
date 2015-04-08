require 'test_helper'

class BreakdownsTest < ActionDispatch::IntegrationTest

  test "adding a new breakdown" do
    create_breakdown
    assert page.has_content?('Test Breakdown')
  end

  test "creating a pick" do
    create_breakdown
    visit breakdown_path(Breakdown.first)
    click_link "Choose"
    assert page.has_no_content?('Here you will select the pictures to use and then click create.')
    assert_equal 1, Breakdown.first.picks.count

  end
  
  test "seeing breakdowns in index" do
    visit breakdowns_path
    assert page.has_content?('First Breakdown')
  end

  def create_breakdown
    visit new_breakdown_path
    fill_in "Name", with: "Test Breakdown"
    click_button "Create Breakdown"
  end

end
