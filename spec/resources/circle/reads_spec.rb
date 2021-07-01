require 'rails_helper'

RSpec.describe CircleResource, type: :resource do
  describe 'serialization' do
    let!(:circle) { create(:circle) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(circle.id)
      expect(data.jsonapi_type).to eq('circles')
    end
  end

  describe 'filtering' do
    let!(:circle1) { create(:circle) }
    let!(:circle2) { create(:circle) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: circle2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([circle2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:circle1) { create(:circle) }
      let!(:circle2) { create(:circle) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            circle1.id,
            circle2.id
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
            circle2.id,
            circle1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
