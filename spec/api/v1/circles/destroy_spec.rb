require "rails_helper"

RSpec.describe "circles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/circles/#{circle.id}"
  end

  describe "basic destroy" do
    let!(:circle) { create(:circle) }

    it "updates the resource" do
      expect(CircleResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Circle.count }.by(-1)
      expect { circle.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
