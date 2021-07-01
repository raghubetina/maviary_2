require "rails_helper"

RSpec.describe "circles_contacts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/circles_contacts/#{circles_contact.id}"
  end

  describe "basic destroy" do
    let!(:circles_contact) { create(:circles_contact) }

    it "updates the resource" do
      expect(CirclesContactResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CirclesContact.count }.by(-1)
      expect { circles_contact.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
