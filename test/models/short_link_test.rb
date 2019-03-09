require 'test_helper'

class ShortLinkTest < ActiveSupport::TestCase
  test 'short codes are added on creation' do
    short_link = ShortLink.create long_url: 'https://google.com'

    assert short_link.short_code.present?
    assert_equal 8, short_link.short_code.length
  end

  test 'tracking visits' do
    short_link = short_links(:kapost)
    Current.referrer = 'rando'
    Current.user_agent = 'also_rando'

    assert_difference('Visit.count') do
      short_link.mark_visit
    end
    assert_equal Current.referrer, short_link.visits.last.referrer
    assert_equal Current.user_agent, short_link.visits.last.user_agent
  end
end
