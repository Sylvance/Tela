class CreateObservers < ActiveRecord::Migration[7.0]
  def change
    create_table :observers do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :observers, :email, unique: true
  end
end
