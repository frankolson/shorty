class Company < ApplicationRecord
  has_many :users
  has_many :short_links, through: :users
end
