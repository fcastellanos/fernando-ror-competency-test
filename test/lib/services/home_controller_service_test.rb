require 'test_helper'

class HomeControllerServiceTest < ActiveSupport::TestCase
    def test_index_returns_category_articles
        data = Services::HomeControllerService.index

        expected_keys = ['rails', 'ruby', 'serverless']

        assert_equal expected_keys, data.keys

        assert_equal 3, data['rails'].size
        assert_equal 3, data['ruby'].size
    end
end