class CreateChairs < ActiveRecord::Migration[6.1]
  def change
    create_table :chairs do |t|
      t.string :name
      t.references :user
      t.string :location
      t.string :description
      t.integer :price
      t.text :image

      t.timestamps
    end
  end
end
