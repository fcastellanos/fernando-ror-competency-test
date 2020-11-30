require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get root_url
        assert_response :success
    end

    # test "index should have 3 categories" do
    #     get root_url

    #     assert_select "div.w-full", 7
    # end
end