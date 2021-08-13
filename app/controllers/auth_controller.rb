class AuthController < ApplicationController

    def create
        user = User.find_by(email_address: params[:email_address])
        if user && user.authenticate(params[:password])
            render json: user, include: '*.*'
        else
            render json: {error: 'Invalid email address or password'}
        end
    end

end
