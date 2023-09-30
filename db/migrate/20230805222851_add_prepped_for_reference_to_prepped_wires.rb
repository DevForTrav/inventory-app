class AddPreppedForReferenceToPreppedWires < ActiveRecord::Migration[7.0]
  def change
    add_reference :prepped_wires, :prepped_for, polymorphic: true, type: :uuid
  end
end
