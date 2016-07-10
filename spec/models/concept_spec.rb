require 'rails_helper'

RSpec.describe Concept, type: :model do
  it { is_expected.to belong_to :terminology }
  it { is_expected.to belong_to :group }
  it { is_expected.to belong_to :language }
end
