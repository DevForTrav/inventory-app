class AddUncutWireReferenceToCircuit < ActiveRecord::Migration[7.0]
  def change
    add_reference :circuits, :uncut_wire, null: false, foreign_key: true, type: :uuid
  end
end
