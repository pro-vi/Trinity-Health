class Attachment < ActiveRecord::Base
    belongs_to :case
    belongs_to :clinician
    has_attached_file :document, styles: { large: "600x600>", medium: "400x400>", thumb: ["100x100>", :jpg]},  default_url: "/documents/:style/missing.png", processors: [:ghostscript]
#  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    do_not_validate_attachment_file_type :document
end
