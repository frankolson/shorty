class User < ApplicationRecord
  belongs_to :company

  has_many :short_links, dependent: :destroy
end
