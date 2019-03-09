class ShortLink < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true
  validates :short_code, uniqueness: true, presence: true

  before_validation :assign_short_code, on: :create

  def assign_short_code
    self.short_code = generate_short_code
  end

  def generate_short_code
    loop do
      code = SecureRandom.hex(4)
      break code unless ShortLink.exists?(short_code: code)
    end
  end
end
