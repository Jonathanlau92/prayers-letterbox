class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
