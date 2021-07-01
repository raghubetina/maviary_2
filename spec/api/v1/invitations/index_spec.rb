require 'rails_helper'

RSpec.describe "invitations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/invitations", params: params
  end

  describe 'basic fetch' do
    let!(:invitation1) { create(:invitation) }
    let!(:invitation2) { create(:invitation) }

    it 'works' do
      expect(InvitationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['invitations'])
      expect(d.map(&:id)).to match_array([invitation1.id, invitation2.id])
    end
  end
end
