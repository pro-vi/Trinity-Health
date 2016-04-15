class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :clinician #clinician who added the note
      t.string :subject
      t.datetime :posting_date
      t.datetime :last_edit_date
      t.references :case
      t.timestamps null: false
    end
  end
end
