json.extract! observer, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url observer_url(observer, format: :json)
