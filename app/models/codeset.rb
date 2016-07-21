class Codeset < ApplicationRecord
  belongs_to :issuer
  has_many :code
end
