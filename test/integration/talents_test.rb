require 'test_helper'

class TalentFlowTest < ActionDispatch::IntegrationTest

  test "view of talent index" do
    visit talents_path
    assert page.has_content?('Bob')
    assert page.has_content?('Mary')
  end

  test "editing a talent shows fields" do
    talent = Talent.first
    visit edit_talent_path(talent)
    assert page.has_field?("First name", with: talent.first_name)
  end

  test "changing a talent saves the changes" do
    talent = Talent.first
    visit edit_talent_path(talent)
    fill_in "First name", with: "Robyn"
    click_button "Update Talent"
    assert talent_path(talent), page.current_path
    assert page.has_content?("Robyn")
  end

  test "adding a new talent shows in the list" do
    visit new_talent_path
    fill_in "First name", with: "Robyn"
    fill_in "Last name", with: "Redbreast"
    fill_in "Middle name", with: "P."
    click_button "Create Talent"
    assert page.has_content?('Robyn')
    visit talents_path
    assert page.has_content?('Robyn')

  end

  test "deleting a talent removes it from the list" do
    visit new_talent_path
    fill_in "First name", with: "Robyn"
    fill_in "Last name", with: "Redbreast"
    fill_in "Middle name", with: "P."
    click_button "Create Talent"
    visit talents_path
    all('tr').last.click_link "Delete"
    visit talents_path
    assert page.has_no_content?('Robyn')
  end

end
