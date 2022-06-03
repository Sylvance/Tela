class CreateElectoralPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :electoral_positions do |t|
      t.string :name
      t.string :jurisdiction
      t.references :picture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
