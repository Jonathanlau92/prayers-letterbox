class AddStatusToPrayer < ActiveRecord::Migration[6.0]
  def change
    add_column :prayers, :status, :integer, :default => 0
    add_index :prayers, :status
  end
end
