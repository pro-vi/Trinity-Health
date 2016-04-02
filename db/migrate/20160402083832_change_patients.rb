class ChangePatients < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.belongs_to :clinician, index: true
      t.belongs_to :case, index: true
    end
  end
end
