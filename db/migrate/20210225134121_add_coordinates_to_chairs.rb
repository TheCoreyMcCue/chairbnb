class AddCoordinatesToChairs < ActiveRecord::Migration[6.1]
  def change
    add_column :chairs, :latitude, :float
    add_column :chairs, :longitude, :float
  end
end
