class Case < ActiveRecord::Base
    validates :name, presence: true
    validates :diagnosis, presence: true
    has_many :clinicians, through: :patients
    has_many :patients
    accepts_nested_attributes_for :clinicians
    has_many :notes
    def self.search(search, collaborator_id)
      if search
        self.joins(:clinicians).where('clinicians.id' => collaborator_id). \
        where("Cases.name like ? OR Cases.diagnosis LIKE ? OR Cases.age LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        self.all
      end
    end
end
