class Circuit < ApplicationRecord
  belongs_to :uncut_wire
  belongs_to :secodary_uncut_wire, class_name: 'UncutWire', optional: true
  belongs_to :wiring_harness
  
  belongs_to :twisted_with_circuit,
             class_name: 'Circuit',
             optional: true,
             foreign_key: 'twisted_with',
             primary_key: 'id'
  has_one :twisted_circuit, class_name: 'Circuit', foreign_key: 'twisted_with'

  has_many :splices

  belongs_to :p1_terminal, class_name: 'Terminal'
  belongs_to :p2_terminal, class_name: 'Terminal'

  belongs_to :p1_wiring_harness_connector, class_name: 'WiringHarnessConnector', optional: true
  belongs_to :p2_wiring_harness_connector, class_name: 'WiringHarnessConnector', optional: true

  def wiring_harness_connectors
    [p1_wiring_harness_connector, p2_wiring_harness_connector]
  end

  def terminals
    # Pluck all terminals from  
    
    [p1_terminal, p2_terminal]
  end

  def self.twisted_circuits
    Circuit.where.not(secondary_uncut_wire_id: [nil, ""])
  end

  def wires
    UncutWire.where(id: [uncut_wire_id, secondary_uncut_wire_id])
  end
end
