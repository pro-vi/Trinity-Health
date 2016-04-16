class Clinician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :name, presence: true
    validates :email, presence: true
    has_many :cases, through: :patients
    has_many :patients
    accepts_nested_attributes_for :cases
    has_many :notes
end
