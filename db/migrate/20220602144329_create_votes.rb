class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :election_period, null: false, foreign_key: true
      t.references :picture, null: false, foreign_key: true
      t.string :serial_no
      t.references :counting_station, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.string :ballot_type
      t.boolean :valid_vote
      t.references :electoral_position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
