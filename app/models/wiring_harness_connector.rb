class WiringHarnessConnector < ApplicationRecord
  belongs_to :wiring_harness
  belongs_to :connector

  has_many :terminals, through: :connectors

  self.implicit_order_column = "created_at"
end
