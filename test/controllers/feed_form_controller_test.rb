require 'test_helper'

class FeedFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_form_index_url
    assert_response :success
  end

end
