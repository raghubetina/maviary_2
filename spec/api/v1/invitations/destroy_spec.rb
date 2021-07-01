require "rails_helper"

RSpec.describe "invitations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/invitations/#{invitation.id}"
  end

  describe "basic destroy" do
    let!(:invitation) { create(:invitation) }

    it "updates the resource" do
      expect(InvitationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Invitation.count }.by(-1)
      expect { invitation.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
