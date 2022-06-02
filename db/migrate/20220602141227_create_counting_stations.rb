class CreateCountingStations < ActiveRecord::Migration[7.0]
  def change
    create_table :counting_stations do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
