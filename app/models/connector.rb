class Connector < ApplicationRecord
  has_many :terminals, dependent: :destroy
  has_many :wiring_harness_connectors
  has_many :wiring_harnesses, through: :wiring_harness_connectors
  # belongs_to :prepop

  self.implicit_order_column = "created_at"
end
