class AddSecondWireToCircuit < ActiveRecord::Migration[7.0]
  def change
    add_reference :circuits, :secondary_uncut_wire, type: :uuid
  end
end
