class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :no_response
    def index
        powers = Power.all
        render json: powers,each_serializer: PowerSerializer
    end
    def show 
        power = Power.find(params[:id])
        render json: power, serializer: PowerSerializer
    end
    def update
        power = Power.find(params[:id])
        if power.update(power_params)
            render json: power, serializer: PowerSerializer
        else
            render json: {error: power.errors.full_messages},status: :unprocessable_entity
        end
    end

    private
    def power_params
        params.require(:power).permit(:name,:description)
    end
    def no_response
        render json: {error: 'Power not found'},status: :unprocessable_entity
    end
end