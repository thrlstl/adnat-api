class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        if User.find_by(email_address: params[:email_address])
        render json: {error: 'Account with this email address already exists.'}
        else
        user = User.create({name: params[:name], email_address: params[:email_address], password: params[:password]})
        render json: user
        end
    end

end
