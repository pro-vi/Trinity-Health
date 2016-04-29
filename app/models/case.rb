class Case < ActiveRecord::Base
    validates :name, presence: true
    validates :diagnosis, presence: true
    has_many :clinicians, through: :patients
    has_many :patients
    accepts_nested_attributes_for :clinicians
    has_many :notes, :dependent => :destroy
    has_many :attachments, :dependent => :destroy
    
    def self.search(search)
      if search
        self.where("name LIKE ? OR diagnosis LIKE ? OR age = ? OR gender LIKE ?", "%#{search}%", "%#{search}%", "#{search.to_i}", "%#{search}%")
      end
    end
end
