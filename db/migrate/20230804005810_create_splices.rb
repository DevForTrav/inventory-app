class CreateSplices < ActiveRecord::Migration[7.0]
  def change
    create_table :splices, id: :uuid do |t|
      t.integer :length
      t.references :terminal, null: false, foreign_key: true, type: :uuid
      t.belongs_to :prepped_wire, null: false, foreign_key: true, type: :uuid
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
