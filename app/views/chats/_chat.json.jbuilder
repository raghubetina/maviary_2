json.extract! chat, :id, :name, :creator_id, :picture, :topic, :link, :cover,
              :event, :starts_at, :ends_at, :created_at, :updated_at
json.url chat_url(chat, format: :json)
