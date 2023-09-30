class CreatePrepops < ActiveRecord::Migration[7.0]
  def change
    create_table :prepops, id: :uuid do |t|
      t.string :name
      t.integer :weekly_need
      t.integer :weekly_quantity
      t.date :due_date

      t.timestamps
    end
  end
end
