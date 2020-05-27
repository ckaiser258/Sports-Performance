require 'test_helper'

class AthleteSportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @athlete_sport = athlete_sports(:one)
  end

  test "should get index" do
    get athlete_sports_url
    assert_response :success
  end

  test "should get new" do
    get new_athlete_sport_url
    assert_response :success
  end

  test "should create athlete_sport" do
    assert_difference('AthleteSport.count') do
      post athlete_sports_url, params: { athlete_sport: { athlete_id: @athlete_sport.athlete_id, sport_id: @athlete_sport.sport_id } }
    end

    assert_redirected_to athlete_sport_url(AthleteSport.last)
  end

  test "should show athlete_sport" do
    get athlete_sport_url(@athlete_sport)
    assert_response :success
  end

  test "should get edit" do
    get edit_athlete_sport_url(@athlete_sport)
    assert_response :success
  end

  test "should update athlete_sport" do
    patch athlete_sport_url(@athlete_sport), params: { athlete_sport: { athlete_id: @athlete_sport.athlete_id, sport_id: @athlete_sport.sport_id } }
    assert_redirected_to athlete_sport_url(@athlete_sport)
  end

  test "should destroy athlete_sport" do
    assert_difference('AthleteSport.count', -1) do
      delete athlete_sport_url(@athlete_sport)
    end

    assert_redirected_to athlete_sports_url
  end
end
