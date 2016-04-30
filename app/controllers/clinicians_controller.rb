class CliniciansController < ApplicationController
  before_action :authenticate_clinician!

  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty, cases_attributes: [:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history, :id])
  end

  def show
    @clinician = Clinician.find(params[:id])
    @allowed = @clinician.id == current_clinician.id
  end
  
  def edit
    @clinician_id = params[:id]
    @clinician = Clinician.find(@clinician_id)
    if @clinician.id != current_clinician.id
      flash[:warning] = "You cannot edit another clinician's profile"
      redirect_to clinician_path(@clinician_id)
    else
      @clinician = Clinician.find(@clinician_id)
    end
  end
  
  def update
    @clinician_id = params[:id].to_i
    @clinician = Clinician.find(@clinician_id)
    if @clinician.update(clinician_params)
      flash[:success] = "Profile was succesfully updated"
      redirect_to clinician_path(@clinician_id)
    else
      render 'edit'
    end
  end

end
