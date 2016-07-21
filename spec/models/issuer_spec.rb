require 'rails_helper'

RSpec.describe Issuer, type: :model do
  it { is_expected.to have_many :codesets }

  let(:issuer) { build :issuer}

  example 'validity check' do
    expect(issuer).to be_valid
  end
end
