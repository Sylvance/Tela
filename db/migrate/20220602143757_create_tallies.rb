class CreateTallies < ActiveRecord::Migration[7.0]
  def change
    create_table :tallies do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :total_count
      t.references :counting_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
