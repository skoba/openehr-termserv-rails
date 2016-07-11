class Terminology < ApplicationRecord
  has_many :groups
  has_many :concepts
end
