class CreateUncutWires < ActiveRecord::Migration[7.0]
  def change
    create_table :uncut_wires, id: :uuid do |t|
      t.string :gauge,            null: false
      t.string :primary_color,    null: false
      t.string :secondary_color,  null: false
      t.integer :length_in_cm,    null: false
      t.date :date_ordered,       null: false, default: Date.today
      t.string :part_number
      t.string :status,           null: false, default: 'in stock'

      t.timestamps
    end
  end
end
