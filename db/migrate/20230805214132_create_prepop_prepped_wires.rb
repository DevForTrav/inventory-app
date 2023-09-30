class CreatePrepopPreppedWires < ActiveRecord::Migration[7.0]
  def change
    create_table :prepop_prepped_wires, id: :uuid do |t|
      t.references :prepop, null: false, foreign_key: true, type: :uuid
      t.references :prepped_wire, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
