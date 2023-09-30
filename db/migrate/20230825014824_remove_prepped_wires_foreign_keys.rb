class RemovePreppedWiresForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :splices, :prepped_wires
  end
end
