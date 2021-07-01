require 'rails_helper'

RSpec.describe "circles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/circles", params: params
  end

  describe 'basic fetch' do
    let!(:circle1) { create(:circle) }
    let!(:circle2) { create(:circle) }

    it 'works' do
      expect(CircleResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['circles'])
      expect(d.map(&:id)).to match_array([circle1.id, circle2.id])
    end
  end
end
