class RemovePreppedWireFromTerminal < ActiveRecord::Migration[7.0]
  def change
    remove_reference :terminals, :prepped_wire, index: true
  end
end
