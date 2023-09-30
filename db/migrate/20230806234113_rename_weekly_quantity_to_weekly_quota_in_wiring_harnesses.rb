class RenameWeeklyQuantityToWeeklyQuotaInWiringHarnesses < ActiveRecord::Migration[7.0]
  def change
    rename_column :wiring_harnesses, :weekly_quantity, :weekly_quota
  end
end
