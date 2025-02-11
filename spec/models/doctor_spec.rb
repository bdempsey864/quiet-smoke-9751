require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doc_patients) }
    it { should have_many(:patients).through(:doc_patients) }
  end
end
