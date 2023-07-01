class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_response
  
    def index
      heros = Hero.all
      render json: heros, each_serializer: HeroSerializer
    end
  
    def show
      hero = Hero.find(params[:id])
      render json: hero,only: [:id,:name,:super_name],include: {powers: {only: [:id,:name,:description]}}
    end
  
    private
  
    def no_response
      render json: { error: "Hero not found" }, status: :unprocessable_entity
    end
  end
  