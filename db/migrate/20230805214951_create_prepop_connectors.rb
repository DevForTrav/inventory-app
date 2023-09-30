class CreatePrepopConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :prepop_connectors, id: :uuid do |t|
      t.references :prepop, null: false, foreign_key: true, type: :uuid
      t.references :connectors, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
