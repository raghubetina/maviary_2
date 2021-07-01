require "rails_helper"

RSpec.describe CirclesContactResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "circles_contacts",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CirclesContactResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CirclesContact.count }.by(1)
    end
  end

  describe "updating" do
    let!(:circles_contact) { create(:circles_contact) }

    let(:payload) do
      {
        data: {
          id: circles_contact.id.to_s,
          type: "circles_contacts",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CirclesContactResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update).to eq(true)
      end.to change { circles_contact.reload.updated_at }
      # .and change { circles_contact.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:circles_contact) { create(:circles_contact) }

    let(:instance) do
      CirclesContactResource.find(id: circles_contact.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CirclesContact.count }.by(-1)
    end
  end
end
