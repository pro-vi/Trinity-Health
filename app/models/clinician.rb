class Clincian < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    has_many :cases, through: :patients
    has_many :patients
end
