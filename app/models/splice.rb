class Splice < ApplicationRecord
  # TODO test whether PREPPED_WIRE_OBJ.terminals returns the terminals on the prepped_wire obj AND the terminals on the splice
  belongs_to :uncut_wire
  belongs_to :terminal
  belongs_to :circuit
end
