class CreateTheLogz < ActiveRecord::Migration[5.2]
  def change
    create_table :the_logz do |t|
      t.integer :year
      t.string :population

      t.timestamps
    end
    add_index :the_logz, :year
    add_index :the_logz, [:year,:population]
  end
end
