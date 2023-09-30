class AddReferencesToPreppedWires < ActiveRecord::Migration[7.0]
  def change
    add_reference :prepped_wires, :prepop, foreign_key: true, type: :uuid
    add_reference :prepped_wires, :wiring_harness, foreign_key: true, type: :uuid
  end
end
