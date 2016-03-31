class CliniciansController < ApplicationController
  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty)
  end
    
  def new
    @clinician = Clinician.new
  end
  
  def create
    @clinician = Clinician.new(_params)
    if clinician.save
      flash[:success] = "Clinician was succesfully created"
      redirect_to _path(@clinician)
    else
      render :new
    end
  
  end
end
