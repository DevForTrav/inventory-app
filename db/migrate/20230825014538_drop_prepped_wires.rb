class DropPreppedWires < ActiveRecord::Migration[7.0]
  def change
    drop_table :prepped_wires
  end
end