json.extract! error, :id, :batch_id, :quantity, :description, :salvageable, :error_for_id, :error_for_type, :created_at, :updated_at
json.url error_url(error, format: :json)
