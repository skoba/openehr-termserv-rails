class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :value, null: false
      t.string :description
      t.references :codeset, foreign_key: true

      t.timestamps
    end
  end
end
