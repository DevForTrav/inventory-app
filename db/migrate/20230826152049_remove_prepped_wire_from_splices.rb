class RemovePreppedWireFromSplices < ActiveRecord::Migration[7.0]
  def change
    remove_column :splices, :prepped_wire_id, null: false, type: :uuid
  end
end
