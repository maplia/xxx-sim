class CreateMonthlies < ActiveRecord::Migration[5.2]
  def change
    create_table :monthlies do |t|
      t.datetime :span_s, null: false
      t.integer :seq, null: false
      t.references :music, null: false
      t.datetime :span_e, null: false

      t.timestamps

      t.index ['Music'.foreign_key, :span_s], unique: true
    end
  end
end
