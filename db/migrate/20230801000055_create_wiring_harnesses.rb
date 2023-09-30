class CreateWiringHarnesses < ActiveRecord::Migration[7.0]
  def change
    create_table :wiring_harnesses, id: :uuid do |t|
      t.string :name
      t.string :company
      t.integer :weekly_quantity
      t.integer :harnesses_completed
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
