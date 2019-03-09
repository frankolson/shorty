class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :referrer
      t.string :user_agent
      t.belongs_to :short_link, foreign_key: true

      t.timestamps
    end
  end
end
