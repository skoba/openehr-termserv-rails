class Concept < ApplicationRecord
  belongs_to :language
  belongs_to :group
  belongs_to :terminology
end
