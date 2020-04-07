class CreatePrayers < ActiveRecord::Migration[6.0]
  def change
    create_table :prayers do |t|
      t.text :request
      t.json :user_particulars
      t.boolean :is_deleted
      t.integer :prayer_count

      t.timestamps
    end
  end
end
