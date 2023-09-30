class CreateConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :connectors, id: :uuid do |t|
      t.string :name
      t.string :part_number
      t.string :company
      t.integer :positions
      t.references :terminal, null: false, foreign_key: true, type: :uuid
      t.references :prepop, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
