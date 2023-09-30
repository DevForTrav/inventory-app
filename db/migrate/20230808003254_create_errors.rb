class CreateErrors < ActiveRecord::Migration[7.0]
  def change
    create_table :errors, id: :uuid do |t|
      t.references :batch, null: false, foreign_key: true, type: :uuid
      t.integer :quantity
      t.text :description
      t.boolean :salvageable
      t.references :error_for, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
