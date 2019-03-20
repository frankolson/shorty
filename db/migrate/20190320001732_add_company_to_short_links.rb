class AddCompanyToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_reference :short_links, :company, foreign_key: true
  end
end
