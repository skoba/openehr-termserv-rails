class CreateCodesets < ActiveRecord::Migration[5.0]
  def change
    create_table :codesets do |t|
      t.string :issuer
      t.string :openehrid
      t.string :externalid

      t.timestamps
    end
  end
end
