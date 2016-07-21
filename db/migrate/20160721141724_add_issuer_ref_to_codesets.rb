class AddIssuerRefToCodesets < ActiveRecord::Migration[5.0]
  def change
    add_reference :codesets, :issuer, foreign_key: true
  end
end
