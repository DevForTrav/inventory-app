json.extract! batch, :id, :batch_for_id, :batch_for_type, :quantity, :status, :user_id, :created_at, :updated_at
json.url batch_url(batch, format: :json)
