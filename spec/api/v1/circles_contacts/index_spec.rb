require "rails_helper"

RSpec.describe "circles_contacts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/circles_contacts", params: params
  end

  describe "basic fetch" do
    let!(:circles_contact1) { create(:circles_contact) }
    let!(:circles_contact2) { create(:circles_contact) }

    it "works" do
      expect(CirclesContactResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["circles_contacts"])
      expect(d.map(&:id)).to match_array([circles_contact1.id,
                                          circles_contact2.id])
    end
  end
end
