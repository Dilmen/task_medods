class PatientsController < ApplicationController
    def index
        @list_patient = Patient.all

        render json: @list_patient, status: :ok
    end

    def create
        @new_patient = Patient.new(patient_params)

        if @new_patient.save
            render json: { status: 'ok', message: 'message' }, status: :ok
        else
            render json: @new_patient.errors, status: :unprocessable_entity
        end
    end

    private

    def patient_params
        params.require(:patient).permit(:full_name, :birthday, :phone_number, :email)
    end
end
