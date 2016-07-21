class RemoveIssuerFromCodesets < ActiveRecord::Migration[5.0]
  def change
    remove_column :codesets, :issuer, :string
  end
end
