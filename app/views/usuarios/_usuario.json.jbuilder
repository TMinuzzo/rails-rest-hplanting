json.extract! usuario, :id, :nome, :senha, :temperaturaIdeal, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
