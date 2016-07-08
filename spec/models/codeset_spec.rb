require 'rails_helper'

RSpec.describe Codeset, type: :model do
  it { is_expected.to have_many :code }

  let(:countries) { build :countries_codeset }

  example 'valid set' do
    expect(countries).to be_valid
  end

end
