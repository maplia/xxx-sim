class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :text_id, null: false
      t.string :lookup_key, null: false
      t.integer :number, default: 0
      t.string :title, null: false
      t.string :subtitle
      t.string :sort_key, null: false
      t.string :artist
      t.decimal :min_bpm
      t.decimal :max_bpm
      t.decimal :level1
      t.integer :notes1
      t.decimal :level2
      t.integer :notes2
      t.decimal :level3
      t.integer :notes3
      t.decimal :level4
      t.integer :notes4
      t.decimal :level5
      t.integer :notes5
      t.date :added_at, null: false
      t.date :revised_at
      t.string :event
      t.boolean :limited, default: false
      t.boolean :hidden, default: false
      t.boolean :deleted, default: false
      t.date :deleted_at
      t.boolean :activated, default: false

      t.timestamps
    end
    add_index :musics, :text_id, unique: true
    add_index :musics, :lookup_key, unique: true
  end
end
