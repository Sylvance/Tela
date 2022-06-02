json.extract! signin, :id, :observer_id, :session_token, :created_at, :updated_at
json.url signin_url(signin, format: :json)
