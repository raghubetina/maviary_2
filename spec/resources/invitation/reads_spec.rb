require 'rails_helper'

RSpec.describe InvitationResource, type: :resource do
  describe 'serialization' do
    let!(:invitation) { create(:invitation) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(invitation.id)
      expect(data.jsonapi_type).to eq('invitations')
    end
  end

  describe 'filtering' do
    let!(:invitation1) { create(:invitation) }
    let!(:invitation2) { create(:invitation) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: invitation2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([invitation2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:invitation1) { create(:invitation) }
      let!(:invitation2) { create(:invitation) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            invitation1.id,
            invitation2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            invitation2.id,
            invitation1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
