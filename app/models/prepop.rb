class Prepop < ApplicationRecord
  belongs_to :wire_harness
  has_many :prepped_wires, as: :prepped_for
end
