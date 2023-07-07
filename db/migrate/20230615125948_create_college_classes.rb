class CreateCollegeClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :college_classes do |t|
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.references :lecturer, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
