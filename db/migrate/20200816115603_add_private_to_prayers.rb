class AddPrivateToPrayers < ActiveRecord::Migration[6.0]
  def change
    add_column :prayers, :private, :boolean
  end
end
