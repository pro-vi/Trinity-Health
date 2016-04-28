class CliniciansController < ApplicationController
  before_action :authenticate_clinician!

  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty, cases_attributes: [:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history, :id])
  end
  
  def select_as_collaborator
    #params[:collaborator] = @clinician
    redirect_to :back, :collaborator => @clinician
  end
  
  def index
    @clinicians = Clinician.all
  end
    
  def new
    @clinician = Clinician.new
    redirect_to new_clinician_registration_path
  end
  
  def create
    @clinician = Clinician.new(clinician_params)
    if @clinician.save
      flash[:success] = "Clinician was succesfully created"
      redirect_to clinician_path(@clinician)
    else
      flash[:danger] = "There was a problem creating the clinician"
      render :new
    end
  end
    
  def show
    @clinician = Clinician.find(params[:id])
  end

end
