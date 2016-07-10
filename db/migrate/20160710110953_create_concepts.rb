class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :conceptid
      t.string :rubric
      t.references :language, foreign_key: true
      t.references :group, foreign_key: true
      t.references :terminology, foreign_key: true

      t.timestamps
    end
  end
end
