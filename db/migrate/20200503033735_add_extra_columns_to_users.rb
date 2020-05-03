class AddExtraColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :church, :string
    add_column :users, :current_stage, :string
    add_column :users, :name, :string
  end
end
