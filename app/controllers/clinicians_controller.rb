class CliniciansController < ApplicationController
  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty)
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
  end
  
  def create
    @clinician = Clinician.new(clinician_params)
    if @clinician.save
      flash[:success] = "Clinician was succesfully created"
      redirect_to clinician_path(@clinician)
    else
      flash[:notice] = "There was a problem creating the clinician"
      render :new
    end
  end
    
  def show
    @clinician = Clinician.find(params[:id])
  end

end
