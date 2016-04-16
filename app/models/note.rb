class Note < ActiveRecord::Base
  validates :subject, presence: true
  validates :note_text, presence: true
  belongs_to :case
  belongs_to :clinician
  
end
