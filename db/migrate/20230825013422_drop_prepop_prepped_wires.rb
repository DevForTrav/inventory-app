class DropPrepopPreppedWires < ActiveRecord::Migration[7.0]
  def change
    drop_table :prepop_prepped_wires
    drop_table :wiring_harness_prepped_wires
  end
end
