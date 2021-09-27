class Patient < ApplicationRecord
  has_many :doc_patients
  has_many :doctors, through: :doc_patients
end
