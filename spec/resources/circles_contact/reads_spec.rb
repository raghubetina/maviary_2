require "rails_helper"

RSpec.describe CirclesContactResource, type: :resource do
  describe "serialization" do
    let!(:circles_contact) { create(:circles_contact) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(circles_contact.id)
      expect(data.jsonapi_type).to eq("circles_contacts")
    end
  end

  describe "filtering" do
    let!(:circles_contact1) { create(:circles_contact) }
    let!(:circles_contact2) { create(:circles_contact) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: circles_contact2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([circles_contact2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:circles_contact1) { create(:circles_contact) }
      let!(:circles_contact2) { create(:circles_contact) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      circles_contact1.id,
                                      circles_contact2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      circles_contact2.id,
                                      circles_contact1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
