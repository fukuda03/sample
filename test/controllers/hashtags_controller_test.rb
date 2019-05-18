require 'test_helper'

class HashtagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hashtags_new_url
    assert_response :success
  end

end
