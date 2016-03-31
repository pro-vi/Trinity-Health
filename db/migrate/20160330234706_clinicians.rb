class CreateClinicians < ActiveRecord::Migration
  def change
    create_table :clinicians do |t|
      t.string :name
      t.string :email
      t.string :specialty
      t.timestamps null: false
    end
  end
end
