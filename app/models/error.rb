class Error < ApplicationRecord
  belongs_to :batch
  belongs_to :error_for, polymorphic: true
end
