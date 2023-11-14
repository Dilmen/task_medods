class RecommendationsController < ApplicationController
    def index
        @list_request = Patient.find(params[:patient_id])
        @recommendation = @list_request.consultation_request.flat_map(&:recommendation)
        

        render json: @recommendation, status: :ok
    end

    def create
        consultation_request_id = params[:consultation_request_id] 
        @recommendation = Recommendation.new(recommendation_consultation_params.merge(consultation_request_id: consultation_request_id))

        puts @recommendation.to_json

        if @recommendation.save
            render json: { status: "ok", message: "message"}, status: :created
        else 
            render json: @recommendation.errors, status: :unprocessable_entity
        end
    end

    private

    def recommendation_consultation_params
        params.require(:recommendation).permit(:text_recommendation)
    end
end
