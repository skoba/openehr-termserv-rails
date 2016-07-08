require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:language) { build :language }

  example 'validity check' do
    expect(language).to be_valid
  end
end
