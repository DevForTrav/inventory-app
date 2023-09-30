class CreateWiringHarnessPreppedWires < ActiveRecord::Migration[7.0]
  def change
    create_table :wiring_harness_prepped_wires, id: :uuid do |t|
      t.references :wiring_harness, null: false, foreign_key: true, type: :uuid
      t.references :prepped_wire, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
