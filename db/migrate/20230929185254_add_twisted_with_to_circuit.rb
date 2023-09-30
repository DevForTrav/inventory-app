class AddTwistedWithToCircuit < ActiveRecord::Migration[7.0]
  def change
    add_column :circuits, :twisted_with, :uuid
    add_foreign_key :circuits, :circuits, column: :twisted_with, type: :uuid
  end
end
