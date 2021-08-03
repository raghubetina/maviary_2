json.extract! invitation, :id, :chat_id, :recipient_id, :token, :clicked,
              :rsvp_status, :role, :sender_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
