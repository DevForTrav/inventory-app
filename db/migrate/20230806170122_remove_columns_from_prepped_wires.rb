class RemoveColumnsFromPreppedWires < ActiveRecord::Migration[7.0]
  def change
    remove_column :prepped_wires, :p1_terminal, :string
    remove_column :prepped_wires, :p2_terminal, :string
    remove_reference :prepped_wires, :prepop, null: false, foreign_key: true, type: :uuid
    remove_column :prepped_wires, :prepped_for_type, :string
    remove_column :prepped_wires, :prepped_for_id, :uuid
  end
end
