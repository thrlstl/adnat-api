class ShiftsController < ApplicationController
    skip_before_action :authorized

    def index
        @shifts = Shift.all
        render json: @shifts
    end

    def create
        @shift = Shift.new(
            start: params[:start],
            finish: params[:finish],
            break_length: params[:break_length],
            user_id: params[:user_id],
            organization_id: params[:organization_id]
        )
        if @shift.valid?
            @shift.save
            render json: { shift: @shift }
        else
            render json: { errors: @shift.errors }
        end
    end

end
