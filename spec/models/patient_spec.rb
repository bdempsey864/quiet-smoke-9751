require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many(:doc_patients)}
    it {should have_many(:doctors).through(:doc_patients)}
  end
end
