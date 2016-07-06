require 'rails_helper'

RSpec.describe Codeset, type: :model do
  let(:countries) { build :countries_codeset }

  it { is_expected.to be_valid }
end
