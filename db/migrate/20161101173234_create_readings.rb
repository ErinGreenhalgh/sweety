class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.integer :glucose_level

      t.timestamps
    end
  end
end
