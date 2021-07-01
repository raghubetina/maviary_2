require 'rails_helper'

RSpec.describe "circles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/circles/#{circle.id}", params: params
  end

  describe 'basic fetch' do
    let!(:circle) { create(:circle) }

    it 'works' do
      expect(CircleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('circles')
      expect(d.id).to eq(circle.id)
    end
  end
end
