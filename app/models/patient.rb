class Patient < ActiveRecord::Base
    belongs_to :case, inverse_of: :patients
    belongs_to :clinician, inverse_of: :patients
end
