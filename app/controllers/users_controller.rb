class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]
    # skip_before_action :is_authorized, only: [:create]
    
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user, include: '*.*'
    end
    
    # SIGN UP
    def create
        if User.find_by(email_address: params[:email_address])
            render json: {error: 'Account with this email address already exists.'}
        else
            @user = User.create(user_params)
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        end
    end
    
    
    # LOG IN
    def login
        @user = User.find_by(email_address: params[:email_address])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid email address or password"}
        end
    end

    # AUTO LOG IN W/ TOKEN
    def auto_login
        render json: @user
    end
    
    private
    
    def user_params
        params.permit(:name, :email_address, :password)
    end

end
