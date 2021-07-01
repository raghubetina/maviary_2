require "rails_helper"

RSpec.describe InvitationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "invitations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      InvitationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Invitation.count }.by(1)
    end
  end

  describe "updating" do
    let!(:invitation) { create(:invitation) }

    let(:payload) do
      {
        data: {
          id: invitation.id.to_s,
          type: "invitations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      InvitationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { invitation.reload.updated_at }
      # .and change { invitation.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:invitation) { create(:invitation) }

    let(:instance) do
      InvitationResource.find(id: invitation.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Invitation.count }.by(-1)
    end
  end
end
