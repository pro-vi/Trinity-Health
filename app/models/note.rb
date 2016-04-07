class Note < ActiveRecord::Base
  validates :subject, :note_text, presence: true
  belongs_to :case
  belongs_to :clinician
end
