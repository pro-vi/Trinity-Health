class Attachment < ActiveRecord::Base
    belongs_to :case
    belongs_to :clinician
    has_attached_file :document, styles: { large: "600x600>", medium: "350x350>", small: "200x250>", thumb: "100x150#"},  default_url: "/documents/:style/missing.png"
#  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    do_not_validate_attachment_file_type :document
end
