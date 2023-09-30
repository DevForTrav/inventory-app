class AddWiringHarnessToPrepop < ActiveRecord::Migration[7.0]
  def change
    add_reference :prepops, :wiring_harness, null: false, foreign_key: true, type: :uuid
  end
end
