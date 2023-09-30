class AddWiringHarnessAndWiringHarnessConnectorToCircuit < ActiveRecord::Migration[7.0]
  def change
    add_reference :circuits, :wiring_harness, null: true, foreign_key: true, type: :uuid
    add_reference :circuits, :p1_wiring_harness_connector, null: true, foreign_key: { to_table: :wiring_harness_connectors}, type: :uuid
    add_reference :circuits, :p2_wiring_harness_connector, null: true, foreign_key: { to_table: :wiring_harness_connectors}, type: :uuid
  end
end
