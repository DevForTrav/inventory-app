class WiringHarness < ApplicationRecord
  belongs_to :user
  has_many :circuits
  has_many :p1_terminals, through: :circuits, source: :p1_terminal
  has_many :p2_terminals, through: :circuits, source: :p2_terminal
  # accepts_nested_attributes_for :prepped_wires

  has_many :wiring_harness_connectors
  has_many :splices, through: :circuits
  has_many :wiring_harness_connectors
  has_many :connectors, through: :wiring_harness_connectors
  # has_many :splices, through: :circuit
  # accepts_nested_attributes_for :connectors

  self.implicit_order_column = "created_at"

  # def terminals
  #   # we need all p1 and p2 terminal ids from circuits
  #   terminal_ids = self.circuits.pluck(:p1_terminal_id, :p2_terminal_id).flatten
  #   Terminal.find(terminal_ids)
  # end

  def terminals
    [p1_terminals, p2_terminals].flatten
  end
end
