class PatientsController < ApplicationController
  def patient_params    
    params.require(:patient).permit(:id, :clinician_id, :case_id)
  end
  
    def new
        @patient = Patient.new
    end
end
