class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :description
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
