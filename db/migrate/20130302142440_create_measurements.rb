class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.datetime :timestamp
      t.decimal :value
      t.string :unit
      t.belongs_to :instrument

      t.timestamps
    end
    add_index :measurements, :instrument_id
  end
end
