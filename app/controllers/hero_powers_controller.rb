class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :no_response


    def create
        hero_power = HeroPower.create(hero_power_params)
        if hero_power.valid?
            render json: hero_power, status: :created, serializer: HeroPowerSerializer
        else
            render json: {error: hero_power.errors.full_messages},status: :unprocessable_entity
        end
    end


    private
    def no_response
        render json: {error: "HeroPower is not found"},status: :unprocessable_entity
    end

    def hero_power_params
        params.require(:hero_power).permit(:power_id,:hero_id,:strength)
    end
  
end