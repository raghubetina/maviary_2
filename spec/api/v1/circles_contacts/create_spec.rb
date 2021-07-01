require 'rails_helper'

RSpec.describe "circles_contacts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/circles_contacts", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'circles_contacts',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CirclesContactResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CirclesContact.count }.by(1)
    end
  end
end
