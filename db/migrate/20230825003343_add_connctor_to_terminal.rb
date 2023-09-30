class AddConnctorToTerminal < ActiveRecord::Migration[7.0]
  def change
    add_reference :terminals, :connector, foreign_key: true, type: :uuid
  end
end
