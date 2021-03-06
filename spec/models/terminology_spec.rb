require 'rails_helper'

RSpec.describe Terminology, type: :model do
  it { is_expected.to have_many :groups }
  it { is_expected.to have_many :concepts }
end
