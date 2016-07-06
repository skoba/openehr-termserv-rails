require 'rails_helper'

RSpec.describe Termonology, type: :model do
  let(:icd10) { FactoryGirl.build :icd10 }

  it { is_expected.to be_valid }
end
