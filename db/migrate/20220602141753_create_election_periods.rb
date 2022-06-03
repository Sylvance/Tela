class CreateElectionPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :election_periods do |t|
      t.string :name
      t.date :date
      t.references :picture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
