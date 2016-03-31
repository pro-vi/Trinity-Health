class Case < ActiveRecord::Base
    validates :name, presence: true
    validates :diagnosis, presence: true
    has_many :clinicians, through: :patients
end
