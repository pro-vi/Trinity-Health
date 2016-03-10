class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.integer :medical_record_num
      t.integer :age
      t.string :gender
      t.string :diagnosis
      t.string :disease_characteristic
      t.string :treatment_history
      t.string :past_medical_history

      t.timestamps null: false
    end
  end
end
