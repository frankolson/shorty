class User < ApplicationRecord
  belongs_to :company, dependent: :destroy

  has_many :short_links
end
