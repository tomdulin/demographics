class CreatePopulations < ActiveRecord::Migration[5.2]
  def change
    create_table :populations do |t|
      t.integer :year
      t.bigint :population

      t.timestamps
    end
  end
end
