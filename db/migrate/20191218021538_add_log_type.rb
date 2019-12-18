class AddLogType < ActiveRecord::Migration[5.2]
  def change
    add_column :the_logz, :calculation_method, :integer, default: 1
  end
end
