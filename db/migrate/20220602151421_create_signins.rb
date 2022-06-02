class CreateSignins < ActiveRecord::Migration[7.0]
  def change
    create_table :signins do |t|
      t.references :observer, null: false, foreign_key: true
      t.string :session_token

      t.timestamps
    end
  end
end
