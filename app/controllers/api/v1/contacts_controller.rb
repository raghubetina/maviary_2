module Api
  module V1
    class ContactsController < Api::V1::GraphitiController
      def index
        contacts = ContactResource.all(params)
        respond_with(contacts)
      end

      def show
        contact = ContactResource.find(params)
        respond_with(contact)
      end

      def create
        contact = ContactResource.build(params)

        if contact.save
          render jsonapi: contact, status: :created
        else
          render jsonapi_errors: contact
        end
      end

      def update
        contact = ContactResource.find(params)

        if contact.update
          render jsonapi: contact
        else
          render jsonapi_errors: contact
        end
      end

      def destroy
        contact = ContactResource.find(params)

        if contact.destroy
          render jsonapi: { meta: {} }, status: :ok
        else
          render jsonapi_errors: contact
        end
      end
    end
  end
end
