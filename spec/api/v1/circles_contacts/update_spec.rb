require "rails_helper"

RSpec.describe "circles_contacts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/circles_contacts/#{circles_contact.id}", payload
  end

  describe "basic update" do
    let!(:circles_contact) { create(:circles_contact) }

    let(:payload) do
      {
        data: {
          id: circles_contact.id.to_s,
          type: "circles_contacts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CirclesContactResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { circles_contact.reload.attributes }
    end
  end
end
