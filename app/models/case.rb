class Case < ActiveRecord::Base
    validates :name, presence: true
    validates :diagnosis, presence: true
    has_many :clinicians, through: :patients
    has_many :patients
    def self.search(search)
      if search
        self.where("name like ? OR diagnosis LIKE ? OR age LIKE ? OR gender like ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        self.all
      end
    end
end
