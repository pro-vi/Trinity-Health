class CasesController < ApplicationController
  
  def case_params    
    params.require(:case).permit(:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history, :id)
  end
  
  def index
    @cases = Clinician.find(params[:clinician_id]).cases
  end
  
  def new
    if clinician_signed_in?
      @clinician = current_clinician
      @case = current_clinician.cases.build
    end
  end
  
  def edit
    if params[:clinician_id] != current_clinician.id
      flash[:warning] = "You cannot edit cases you are not a part of"
      redirect_to clinician_cases_path(current_clinician.id)
    else
      @clinician = Clinician.find(params[:clinician_id])
      @case = @clinician.cases.find(params[:id])
    end
  end
  
  def create
    @case = Case.new(case_params)
    if @case.save
      flash[:success] = "Case was succesfully created"
      redirect_to clinician_case_path(params[:clinician_id], @case.id)
    else
      render :new
    end
  end
  
  def update
    # @clinician = Clinician.find(current_clinician.id)
    @case = Case.find(params[:id])
    if @case.update(case_params)
      flash[:success] = "Case was succesfully updated"
      redirect_to clinician_case_path(@case)
    else
      render 'edit'
    end
  end
  
  def show
    @case = Clinician.find(params[:clinician_id]).cases.find(params[:id])
  end
  
  def destroy
    @clinician = Clinician.find(params[:clinician_id])
    @case = Case.find(params[:id])
    @case.destroy
    flash[:success] = "Case was succesfully deleted"
    redirect_to clinician_cases_path(params[:clinician_id])
  end

end
