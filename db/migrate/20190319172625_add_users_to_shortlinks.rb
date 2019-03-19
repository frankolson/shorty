class AddUsersToShortlinks < ActiveRecord::Migration[5.2]
  def change
    add_reference :short_links, :user, foreign_key: true
  end
end
