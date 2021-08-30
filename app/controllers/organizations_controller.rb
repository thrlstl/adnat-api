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
    
    def update
        @organization = Organization.find(params[:id])
        @organization.update(name: params[:name], hourly_rate: params[:hourly_rate])
        render json: @organization
    end

end
