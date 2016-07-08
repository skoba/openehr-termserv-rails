require 'rails_helper'

RSpec.describe Code, type: :model do
  it { is_expected.to belong_to :codeset }

  let(:country) { build :country_code }

  example 'valid codes' do
    expect(country).to be_valid
  end
end
