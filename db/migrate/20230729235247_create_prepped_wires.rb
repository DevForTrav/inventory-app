class CreatePreppedWires < ActiveRecord::Migration[7.0]
  def change
    create_table :prepped_wires, id: :uuid do |t|
      t.references :uncut_wire, null: false, foreign_key: true, type: :uuid
      #TODO: create migration to add prepped_wires reference
      # t.references :prepop, null: true, foreign_key: true, type: :uuid
      t.string :p1_terminal
      t.string :p2_terminal
      t.integer :length_in_cm
      t.string :priority

      t.timestamps
    end
    #TODO
    # add_index :prepped_wires, :uncut_wire,    unique: true
    #TODO: create migration to add prepped_wires index
    # add_index :prepped_wires, :prepop,        unique: true
  end
end
