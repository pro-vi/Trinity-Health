class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :case
    end
  end
end
