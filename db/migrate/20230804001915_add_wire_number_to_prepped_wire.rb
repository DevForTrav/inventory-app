class AddWireNumberToPreppedWire < ActiveRecord::Migration[7.0]
  def change
    add_column :prepped_wires, :wire_number, :string
  end
end
