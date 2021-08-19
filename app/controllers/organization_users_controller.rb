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

    def destroy
        @organization_users_item = OrganizationUser.find_by(organization_id: params[:organization_id], user_id: params[:user_id])
        if @organization_users_item
            @organization_users_item.delete
        else
            render json: { error: 'Sorry, try again!' }
        end
    end

end
