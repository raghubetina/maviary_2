require "rails_helper"

RSpec.describe "circles_contacts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/circles_contacts/#{circles_contact.id}", params: params
  end

  describe "basic fetch" do
    let!(:circles_contact) { create(:circles_contact) }

    it "works" do
      expect(CirclesContactResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("circles_contacts")
      expect(d.id).to eq(circles_contact.id)
    end
  end
end
