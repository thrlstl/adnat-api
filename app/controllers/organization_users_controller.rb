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

    def leave
        @organization_users_item = OrganizationUser.find_by(organization_id: params[:organization_id], user_id: params[:user_id])
        if @organization_users_item
            @shifts = Shift.where(organization_id: params[:organization_id], user_id: params[:user_id])
            @shifts.destroy_all
            @organization_users_item.delete
            render json: { success: true }
        else
            render json: { error: 'Sorry, try again!' }
        end
    end

end
