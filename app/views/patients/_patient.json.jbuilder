json.extract! patient, :id, :user_id, :reading_value, :created_at, :updated_at
json.url patient_url(patient, format: :json)
