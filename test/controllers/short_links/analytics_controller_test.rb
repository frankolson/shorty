require 'test_helper'

module ShortLinks
  class AnalyticsControllerTest < ActionDispatch::IntegrationTest
    test 'should redirect short_link' do
      # API access
      short_link = short_links(:kapost)
      get short_link_analytics_url(short_link.short_code), as: :json

      assert_response :ok
      assert_equal short_link.visits.size, response.parsed_body.size

      # HTML access
      short_link = short_links(:kapost)
      get short_link_analytics_url(short_link.short_code)

      assert_response :ok
      assert_equal short_link.visits.size, response.parsed_body.size
    end

    test 'should handle missing links' do
      get short_link_analytics_url('definitely_not_a_short_link'), as: :json

      assert_response :not_found
      assert_equal 'URL not found', response.parsed_body['errors']
    end
  end
end
