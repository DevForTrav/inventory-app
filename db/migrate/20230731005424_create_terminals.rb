class CreateTerminals < ActiveRecord::Migration[7.0]
  def change
    create_table :terminals, id: :uuid do |t|
      t.string :name
      t.string :abbreviation
      t.integer :quantity
      t.belongs_to :prepped_wire, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
