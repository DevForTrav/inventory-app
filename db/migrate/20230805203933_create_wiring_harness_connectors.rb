class CreateWiringHarnessConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :wiring_harness_connectors, id: :uuid do |t|
      t.references :wiring_harness, foreign_key: true, null: false, type: :uuid
      t.references :connector, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
