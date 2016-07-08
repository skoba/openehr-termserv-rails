class CreateTerminologies < ActiveRecord::Migration[5.0]
  def change
    create_table :terminologies do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
