require "application_system_test_case"

class CoachSportsTest < ApplicationSystemTestCase
  setup do
    @coach_sport = coach_sports(:one)
  end

  test "visiting the index" do
    visit coach_sports_url
    assert_selector "h1", text: "Coach Sports"
  end

  test "creating a Coach sport" do
    visit coach_sports_url
    click_on "New Coach Sport"

    fill_in "Coach", with: @coach_sport.coach_id
    fill_in "Sport", with: @coach_sport.sport_id
    click_on "Create Coach sport"

    assert_text "Coach sport was successfully created"
    click_on "Back"
  end

  test "updating a Coach sport" do
    visit coach_sports_url
    click_on "Edit", match: :first

    fill_in "Coach", with: @coach_sport.coach_id
    fill_in "Sport", with: @coach_sport.sport_id
    click_on "Update Coach sport"

    assert_text "Coach sport was successfully updated"
    click_on "Back"
  end

  test "destroying a Coach sport" do
    visit coach_sports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coach sport was successfully destroyed"
  end
end
