class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        render json: camper
    # rescue ActiveRecord::RecordNotFound
    #     render json: { error: "Camper not found" }, status: :not_found
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper
    end

    private

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_invalid
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

    # def render_invalid(invalid_camper)
    #     render json: { errors: invalid_camper.record.errors.full_messages }, status: :unprocessable_entity
    # end

    def camper_params
        params.permit(:name, :age)
    end




end
