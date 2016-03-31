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
    
  def show
    @clinician = Clinician.find(params[:id])
  end
  
  def update
    @clinician = Clinician.find(params[:id])
    if @clinician.update(clinician_params)
      redirect_to cases_path #NEED TO CHANGE THIS
    else
      render 'edit'
    end
  end
  
  def edit
    @clinician = Clinician.find(params[:id])
  end
 
  def destroy
    @clinician = Clinician.find(params[:id])
    @clinician.destroy
    redirect_to cases_path #NEED TO CHANGE THIS
  end
end
