class OrganizationsController < ApplicationController
    skip_before_action :authorized

    def index
        @organizations = Organization.all
        render json: @organizations
    end

    def show
        @organization = Organization.find(params[:id])
        render json: @organization
    end

    def create
        @organization = Organization.new(name: params[:name], hourly_rate: params[:hourly_rate])
        if @organization.valid?
            @organization.save
            OrganizationUser.create(organization_id: @organization.id, user_id: params[:user_id])
            render json: { success: true }
        else
            render json: { errors: @organization.errors }
        end
    end
    
    def update
        @organization = Organization.find(params[:id])
        @organization.update(name: params[:name], hourly_rate: params[:hourly_rate])
        render json: @organization
    end

    def join
        @organization = Organization.find(params[:organization_id])
        if @organization.users.find_by(id: params[:user_id])
            render json: { error: 'You are already a member of this organization.' }
        else
            @organization.organization_users.create(user_id: params[:user_id])
            render json: { success: true }
        end
    end

end
