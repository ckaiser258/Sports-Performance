require "application_system_test_case"

class AthleteSportsTest < ApplicationSystemTestCase
  setup do
    @athlete_sport = athlete_sports(:one)
  end

  test "visiting the index" do
    visit athlete_sports_url
    assert_selector "h1", text: "Athlete Sports"
  end

  test "creating a Athlete sport" do
    visit athlete_sports_url
    click_on "New Athlete Sport"

    fill_in "Athlete", with: @athlete_sport.athlete_id
    fill_in "Sport", with: @athlete_sport.sport_id
    click_on "Create Athlete sport"

    assert_text "Athlete sport was successfully created"
    click_on "Back"
  end

  test "updating a Athlete sport" do
    visit athlete_sports_url
    click_on "Edit", match: :first

    fill_in "Athlete", with: @athlete_sport.athlete_id
    fill_in "Sport", with: @athlete_sport.sport_id
    click_on "Update Athlete sport"

    assert_text "Athlete sport was successfully updated"
    click_on "Back"
  end

  test "destroying a Athlete sport" do
    visit athlete_sports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Athlete sport was successfully destroyed"
  end
end
