class Group < ApplicationRecord
  belongs_to :terminology
  has_many :concepts
end
