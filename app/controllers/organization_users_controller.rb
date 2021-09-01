class OrganizationUsersController < ApplicationController

    skip_before_action :authorized

    def index
        @organization_users = OrganizationUser.all
        render json: @organization_users
    end

    def show
        @organization_users = OrganizationUser.find_by(organization_id: params[:id])
        render json: @organization_users
    end

    # LEAVE ORGANIZATION
    def destroy
        @organization_users_item = OrganizationUser.find_by(organization_id: params[:organization_id], user_id: params[:user_id])
        if @organization_users_item
            @shifts = Shift.where(organization_id: params[:organization_id], user_id: params[:user_id])
            @shifts.destroy_all
            @organization_users_item.delete
        else
            render json: { error: 'Sorry, try again!' }
        end
    end


    # JOIN ORGANIZATION
    def create
        if OrganizationUser.find_by(organization_id: params[:organization_id], user_id: params[:user_id])
            render json: {error: 'You are already a member of this organization.'}
        else
            OrganizationUser.create(organization_id: params[:organization_id], user_id: params[:user_id])
            render json: {success: true}
        end
    end

end
