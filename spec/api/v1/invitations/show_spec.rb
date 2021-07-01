require "rails_helper"

RSpec.describe "invitations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/invitations/#{invitation.id}", params: params
  end

  describe "basic fetch" do
    let!(:invitation) { create(:invitation) }

    it "works" do
      expect(InvitationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("invitations")
      expect(d.id).to eq(invitation.id)
    end
  end
end
