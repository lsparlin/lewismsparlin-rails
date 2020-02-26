require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get blog_show_url
    assert_response :success
  end

end
