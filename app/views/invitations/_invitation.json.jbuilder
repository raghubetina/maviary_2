json.extract! invitation, :id, :chat_id, :user_id, :token, :clicked, :rsvp_status, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
