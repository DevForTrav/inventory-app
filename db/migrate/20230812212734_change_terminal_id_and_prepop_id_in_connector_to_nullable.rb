class ChangeTerminalIdAndPrepopIdInConnectorToNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:connectors, :terminal_id, true)
    change_column_null(:connectors, :prepop_id, true)
  end
end
