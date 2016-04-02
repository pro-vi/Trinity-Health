class CliniciansController < ApplicationController
  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty)
  end
    
  def new
    @clinician = Clinician.new
    render '/clinicians/sign_up'
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
    # if params[:id] == "sign_out"
    #   puts "SDFS"
    #   redirect_to destroy_clinician_session_path, :method => :delete
    #   return
    # end
    @clinician = Clinician.find(params[:id])
  end

end
