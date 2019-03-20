require 'test_helper'

class ShortLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short_link = short_links(:kapost)
  end

  test 'should create short_link' do
    assert_difference('ShortLink.count') do
      post short_link_url, as: :json,
        params: { long_url: 'https://google.com', user_id: users(:ian).id }
    end

    assert_response :created
    assert_equal 'https://google.com', response.parsed_body['long_url']
    assert_equal users(:ian).username, response.parsed_body['created_by']
    assert_equal users(:ian).company.name, response.parsed_body['company']
  end

  test 'should create non company scoped duplicate shortlinks' do
    assert_difference('ShortLink.count') do
      post short_link_url, as: :json,
        params: { long_url: @short_link.long_url, user_id: users(:will).id }
    end

    assert_response :created
    assert_equal users(:will).username, response.parsed_body['created_by']
    assert_equal users(:will).company.name, response.parsed_body['company']
  end

  test 'should not create company scoped duplicate short_links' do
    assert_no_difference('ShortLink.count') do
      post short_link_url, as: :json,
        params: { long_url: @short_link.long_url, user_id: users(:ian).id }
    end

    assert_response :created
    assert_equal @short_link.long_url, response.parsed_body['long_url']
    assert_equal shortened_url(@short_link.short_code),
      response.parsed_body['short_link']
  end

  test 'should redirect short_link' do
    # API redirect
    get shortened_url(@short_link.short_code), as: :json
    assert_response :moved_permanently
    assert_redirected_to @short_link.long_url

    # HTML redirect
    get shortened_url(@short_link.short_code)
    assert_response :moved_permanently
    assert_redirected_to @short_link.long_url
  end

  test 'should handle missing links' do
    get shortened_url('definitely_not_a_short_link'), as: :json

    assert_response :not_found
    assert_equal 'URL not found', response.parsed_body['errors']
  end

  test 'should track show visits' do
    assert_difference('Visit.count') do
      get shortened_url(@short_link.short_code), as: :json
    end

    assert_response :moved_permanently
  end
end
