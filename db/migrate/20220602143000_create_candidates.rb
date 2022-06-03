class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :iebc_id
      t.references :picture, null: false, foreign_key: true
      t.references :election_period, null: false, foreign_key: true
      t.references :electoral_position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
