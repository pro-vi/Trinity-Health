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
      @case = current_clinician.cases.build
    end
  end
  
  def edit
    @case = Case.find(params[:id])
  end
  
  def create
    @case = Case.new(case_params)
    if @case.save
      flash[:success] = "Case was succesfully created"
      redirect_to case_path(@case)
    else
      render :new
    end
  end
  
  def update
    @case = Case.find(params[:id])
    if @case.update(case_params)
      flash[:success] = "Case was succesfully updated"
      redirect_to case_path(@case)
    else
      render 'edit'
    end
  end
  
  def show
    @case = Case.find(params[:id])
  end
  
  def destroy
    @case = Case.find(params[:id])
    @case.destroy
    flash[:success] = "Case was succesfully deleted"
    redirect_to cases_path
  end

end
