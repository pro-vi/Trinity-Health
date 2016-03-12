class CasesController < ApplicationController
  
  def case_params    
    params.require(:case).permit(:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history)
  end
  
  def index
    @cases = Case.all
  end
  
  def new
    @case = Case.new
  end
  
  def edit
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
    if @case.update(case_params)
      flash[:success] = "Case was successfully updated"
      redirect_to case_path(@case)
    else
      render :edit
    end
  end
  
  def show
    @case = Case.find(params[:id])
  end
  
  def destroy
    @case.destroy
    flash[:danger] = "Case was successfully deleted"
    redirect_to cases_path
  end

end
