json.extract! contact, :id, :adder_id, :name, :added_id, :email, :picture, :created_at, :updated_at
json.url contact_url(contact, format: :json)
