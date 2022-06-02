class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :observer, null: false, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
