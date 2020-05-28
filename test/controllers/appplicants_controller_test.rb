require 'test_helper'

class AppplicantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get appplicants_new_url
    assert_response :success
  end

  test "should get create" do
    get appplicants_create_url
    assert_response :success
  end

end
