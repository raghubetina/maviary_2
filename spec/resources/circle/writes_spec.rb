require 'rails_helper'

RSpec.describe CircleResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'circles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CircleResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Circle.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:circle) { create(:circle) }

    let(:payload) do
      {
        data: {
          id: circle.id.to_s,
          type: 'circles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CircleResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { circle.reload.updated_at }
      # .and change { circle.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:circle) { create(:circle) }

    let(:instance) do
      CircleResource.find(id: circle.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Circle.count }.by(-1)
    end
  end
end
