class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :terminology, foreign_key: true

      t.timestamps
    end
  end
end
