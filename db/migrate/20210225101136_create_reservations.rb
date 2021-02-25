class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chair, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
