class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :short_links, dependent: :destroy
end
