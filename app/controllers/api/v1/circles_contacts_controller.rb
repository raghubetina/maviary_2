module Api
  module V1
    class CirclesContactsController < Api::V1::GraphitiController
      def index
        circles_contacts = CirclesContactResource.all(params)
        respond_with(circles_contacts)
      end

      def show
        circles_contact = CirclesContactResource.find(params)
        respond_with(circles_contact)
      end

      def create
        circles_contact = CirclesContactResource.build(params)

        if circles_contact.save
          render jsonapi: circles_contact, status: :created
        else
          render jsonapi_errors: circles_contact
        end
      end

      def update
        circles_contact = CirclesContactResource.find(params)

        if circles_contact.update
          render jsonapi: circles_contact
        else
          render jsonapi_errors: circles_contact
        end
      end

      def destroy
        circles_contact = CirclesContactResource.find(params)

        if circles_contact.destroy
          render jsonapi: { meta: {} }, status: :ok
        else
          render jsonapi_errors: circles_contact
        end
      end
    end
  end
end
