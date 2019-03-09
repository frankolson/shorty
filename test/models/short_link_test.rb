require 'test_helper'

class ShortLinkTest < ActiveSupport::TestCase
  test 'short codes are added on creation' do
    short_link = ShortLink.create long_url: 'https://google.com'

    assert short_link.short_code.present?
    assert_equal 8, short_link.short_code.length
  end
end
