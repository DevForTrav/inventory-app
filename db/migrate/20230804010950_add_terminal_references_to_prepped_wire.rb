class AddTerminalReferencesToPreppedWire < ActiveRecord::Migration[7.0]
  def change
    add_reference :prepped_wires, :p1_terminal
    add_reference :prepped_wires, :p2_terminal
  end
end
