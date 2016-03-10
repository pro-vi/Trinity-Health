class CasesController < ApplicationController
  before_action :set_case, only: [:edit, :update, :show, :destroy]
  
  
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
  end
  
  def destroy
    @case.destroy
    flash[:danger] = "Case was successfully deleted"
    redirect_to cases_path
  end
  
  private
  def set_case
    @case = Case.find(params[:id])
  end
  def case_params    
    params.require(:case).permit(:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history)
  end

end
