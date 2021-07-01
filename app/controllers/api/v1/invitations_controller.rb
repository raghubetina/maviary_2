module Api
  module V1
    class InvitationsController < Api::V1::GraphitiController
      def index
        invitations = InvitationResource.all(params)
        respond_with(invitations)
      end

      def show
        invitation = InvitationResource.find(params)
        respond_with(invitation)
      end

      def create
        invitation = InvitationResource.build(params)

        if invitation.save
          render jsonapi: invitation, status: :created
        else
          render jsonapi_errors: invitation
        end
      end

      def update
        invitation = InvitationResource.find(params)

        if invitation.update
          render jsonapi: invitation
        else
          render jsonapi_errors: invitation
        end
      end

      def destroy
        invitation = InvitationResource.find(params)

        if invitation.destroy
          render jsonapi: { meta: {} }, status: :ok
        else
          render jsonapi_errors: invitation
        end
      end
    end
  end
end
