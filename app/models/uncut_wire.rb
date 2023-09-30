class UncutWire < ApplicationRecord
  self.implicit_order_column = "created_at"

  def name
    if secondary_color.present?
      "#{gauge} #{primary_color}/#{secondary_color}"
    else
      "#{gauge} #{primary_color}"
    end
  end

  def color
    if secondary_color.present?
      "#{primary_color}/#{secondary_color}"
    else
      primary_color
    end
  end
end
