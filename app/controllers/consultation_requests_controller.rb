class ConsultationRequestsController < ApplicationController
    def index
        render json: {}, status: :ok
    end

    def create
        @new_request = ConsultationRequest.new(consultation_request_params)

        if @new_request.save
            render json: { status: "ok", message: "message"}, status: :created
        else 
            render json: @new_request.errors, status: :unprocessable_entity
        end
    end

    def data_analyze
        render json: analyze
    end

    private 

    def consultation_request_params
        params.require(:consultation_request).permit(:patient_id, :text_query)
    end

    def analyze
        require 'net/http'
        require 'json'
      
        url = URI.parse('https://api.fda.gov/other/substance.json?limit=1')
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
      
        request = Net::HTTP::Get.new(url.path, {'Content-Type' => 'application/json'})
        response = http.request(request)
      
        if response.code.to_i == 200
          data = JSON.parse(response.body)
        else
          data = { error: "Failed to retrieve data from FDA API", status: response.code }
        end

        data["results"][0]["codes"][0]
      end      
end
