class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches, id: :uuid do |t|
      t.references :batch_for, polymorphic: true, null: false, type: :uuid
      t.integer :quantity
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
