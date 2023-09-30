class PreppedWire < ApplicationRecord
  belongs_to :uncut_wire

  has_many :prepop_prepped_wires
  has_many :prepops, through: :prepop_prepped_wires

  has_many :wiring_harness_prepped_wires
  has_many :wiring_harnesses, through: :wiring_harness_prepped_wires

  has_many :p1_terminals, class_name: 'Terminal', foreign_key: 'p1_terminal_id'
  has_many :p2_terminals, class_name: 'Terminal', foreign_key: 'p2_terminal_id'

  def name
    self.uncut_wire.name
  end
end