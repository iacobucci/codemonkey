require "test_helper"

class Api::UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_uploads_create_url
    assert_response :success
  end
end
