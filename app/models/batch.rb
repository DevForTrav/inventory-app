class Batch < ApplicationRecord
  belongs_to :batch_for, polymorphic: true
  belongs_to :user
end
