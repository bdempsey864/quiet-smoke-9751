class Hospital < ApplicationRecord
  has_many :doctors

  def self.unique_universities(hospital_id)
    Doctor.select(:university).distinct
  end
end
