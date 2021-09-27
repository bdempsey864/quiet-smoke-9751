class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doc_patients
  has_many :patients, through: :doc_patients
end
