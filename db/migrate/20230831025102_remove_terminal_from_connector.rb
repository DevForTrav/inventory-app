class RemoveTerminalFromConnector < ActiveRecord::Migration[7.0]
  def change
    remove_column :connectors, :terminal_id, :string
  end
end
