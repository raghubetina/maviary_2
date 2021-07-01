require "rails_helper"

RSpec.describe "circles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/circles/#{circle.id}", payload
  end

  describe "basic update" do
    let!(:circle) { create(:circle) }

    let(:payload) do
      {
        data: {
          id: circle.id.to_s,
          type: "circles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CircleResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { circle.reload.attributes }
    end
  end
end
