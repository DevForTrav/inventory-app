class AddCircuitReferenceToSplice < ActiveRecord::Migration[7.0]
  def change
    add_reference :splices, :circuit, null: false, foreign_key: true, type: :uuid
  end
end
