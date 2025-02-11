require 'rails_helper'

RSpec.describe 'doctor show page' do
  before :each do
    @hospital_1 = Hospital.create!(name: "Memorial")
    @hospital_2 = Hospital.create!(name: "General")

    @doc_1 = @hospital_1.doctors.create!(name: "Dre", specialty: "Tunes", university: "Hard Knocks") 
    @doc_2 = @hospital_1.doctors.create!(name: "Martin", specialty: "Shoes", university: "Hard Knocks") 
    @doc_3 = @hospital_2.doctors.create!(name: "Jay", specialty: "Ballin", university: "UCLA")

    @p_1 = Patient.create!(name: "Derek", age: 30)
    @p_2 = Patient.create!(name: "Randy", age: 22)
    @p_3 = Patient.create!(name: "George", age: 2)
    @p_4 = Patient.create!(name: "Frank", age: 3)
    @p_5 = Patient.create!(name: "Gaylord", age: 75)
    @p_6 = Patient.create!(name: "Suzzy", age: 23)

    DocPatient.create!(patient: @p_1, doctor: @doc_1)
    DocPatient.create!(patient: @p_3, doctor: @doc_1)
    DocPatient.create!(patient: @p_4, doctor: @doc_1)
    DocPatient.create!(patient: @p_2, doctor: @doc_2)
    DocPatient.create!(patient: @p_5, doctor: @doc_3)
    DocPatient.create!(patient: @p_6, doctor: @doc_3)

    visit "hospitals/#{@hospital_1.id}"
  end

  it 'returns hospitals name' do
    expect(page).to have_content(@hospital_1.name)
  end

  it 'shows the number of doctors working at hospital' do
    expect(page).to have_content("Number of Doctors: 2")
  end

  it 'does not show university duplicates' do
    expect(page).to have_content("Hard Knocks", count: 1)
  end
end