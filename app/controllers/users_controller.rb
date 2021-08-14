class UsersController < ApplicationController
    # skip_before_action :is_authorized, only: [:create]

    def login
        user = User.find_by(email_address: params[:email_address])
        if user && user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: user, token: token}
        else
            render json: {error: 'Invalid email address or password'}, status: :unauthorized 
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def show
        user = User.find(params[:id])
        render json: user, include: '*.*'
    end

    def create
        if User.find_by(email_address: params[:email_address])
        render json: {error: 'Account with this email address already exists.'}
        else
        user = User.create({name: params[:name], email_address: params[:email_address], password: params[:password]})
        render json: user, status: :created
        end
    end

end
