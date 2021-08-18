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

end
