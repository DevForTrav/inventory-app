class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits, id: :uuid do |t|
      t.string :number
      t.string :position, array: true, default: []
      t.integer :length
      t.references :p1_terminal, null: false, type: :uuid
      t.references :p2_terminal, null: false, type: :uuid
      t.integer :quantity

      t.timestamps
    end
  end
end
