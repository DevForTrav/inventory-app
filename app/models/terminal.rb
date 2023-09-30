class Terminal < ApplicationRecord
  has_many :circuits
  # belongs_to :p1_terminal, class_name: 'Terminal'
  # belongs_to :p2_terminal, class_name: 'Terminal'
  belongs_to :connector, dependent: :destroy, optional: true

  self.implicit_order_column = "created_at"
end
