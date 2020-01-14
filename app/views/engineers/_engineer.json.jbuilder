# frozen_string_literal: true

json.extract! engineer, :id, :created_at, :updated_at
json.url engineer_url(engineer, format: :json)
