class AddReferenceToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :case, index: true, foreign_key: true
    add_reference :patients, :clinician, index: true, foreign_key: true
  end
end
