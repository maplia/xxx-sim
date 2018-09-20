class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :user, foreign_key: true
      t.references :music, foreign_key: true
      t.integer :stat1
      t.boolean :locked1
      t.integer :gauge1
      t.decimal :point1
      t.decimal :rate1
      t.boolean :rate1_f
      t.integer :grade1
      t.integer :combo1
      t.integer :score1
      t.integer :stat2
      t.boolean :locked2
      t.integer :gauge2
      t.decimal :point2
      t.decimal :rate2
      t.boolean :rate2_f
      t.integer :grade2
      t.integer :combo2
      t.integer :score2
      t.integer :stat3
      t.boolean :locked3
      t.integer :gauge3
      t.decimal :point3
      t.decimal :rate3
      t.boolean :rate3_f
      t.integer :grade3
      t.integer :combo3
      t.integer :score3
      t.integer :stat4
      t.boolean :locked4
      t.integer :gauge4
      t.decimal :point4
      t.decimal :rate4
      t.boolean :rate4_f
      t.integer :grade4
      t.integer :combo4
      t.integer :score4
      t.integer :stat5
      t.boolean :locked5
      t.integer :gauge5
      t.decimal :point5
      t.decimal :rate5
      t.boolean :rate5_f
      t.integer :grade5
      t.integer :combo5
      t.integer :score5
      t.string :comment
      t.integer :best_diff
      t.decimal :best_point
      t.integer :l_best_diff
      t.decimal :l_best_point

      t.timestamps

      t.index ['User'.foreign_key, 'Music'.foreign_key], unique: true
    end
  end
end
