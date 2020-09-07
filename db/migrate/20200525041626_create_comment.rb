class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.boolean :is_deleted
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
