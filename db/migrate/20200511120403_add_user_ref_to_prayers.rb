class AddUserRefToPrayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :prayers, :user, null: true, foreign_key: true
  end
end
