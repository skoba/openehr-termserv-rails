class CreateTermonologies < ActiveRecord::Migration[5.0]
  def change
    create_table :termonologies do |t|
      t.string :name, null: false
      t.string :version

      t.timestamps
    end
  end
end
