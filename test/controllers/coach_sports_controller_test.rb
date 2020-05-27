require 'test_helper'

class CoachSportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coach_sport = coach_sports(:one)
  end

  test "should get index" do
    get coach_sports_url
    assert_response :success
  end

  test "should get new" do
    get new_coach_sport_url
    assert_response :success
  end

  test "should create coach_sport" do
    assert_difference('CoachSport.count') do
      post coach_sports_url, params: { coach_sport: { coach_id: @coach_sport.coach_id, sport_id: @coach_sport.sport_id } }
    end

    assert_redirected_to coach_sport_url(CoachSport.last)
  end

  test "should show coach_sport" do
    get coach_sport_url(@coach_sport)
    assert_response :success
  end

  test "should get edit" do
    get edit_coach_sport_url(@coach_sport)
    assert_response :success
  end

  test "should update coach_sport" do
    patch coach_sport_url(@coach_sport), params: { coach_sport: { coach_id: @coach_sport.coach_id, sport_id: @coach_sport.sport_id } }
    assert_redirected_to coach_sport_url(@coach_sport)
  end

  test "should destroy coach_sport" do
    assert_difference('CoachSport.count', -1) do
      delete coach_sport_url(@coach_sport)
    end

    assert_redirected_to coach_sports_url
  end
end
