class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    # def index
    #     signups = Signup.all
    #     render json: signups
    # end

    def create
        signup = Signup.create!(signup_params)
        render json: signup
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_invalid
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

end
