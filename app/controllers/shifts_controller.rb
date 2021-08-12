class ShiftsController < ApplicationController

    def index
        @shifts = Shift.all
        render json: @shifts
    end

end
