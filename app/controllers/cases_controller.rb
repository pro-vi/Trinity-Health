class CasesController < ApplicationController
  before_action :authenticate_clinician!
  
  def case_params    
    params.require(:case).permit(:name, :diagnosis, :age, :gender, 
      :disease_characteristic, :treatment_history, :past_medical_history, :id, clinician_attributes: [:name, :email, :speciality])
  end
  
  def assign_collaborator
    @clinician = Clinician.find(params[:clinician_id])
    @case = @clinician.cases.find(params[:id])
    collaborator = Clinician.find(params[:collaborator])
    @case.clinicians << collaborator
    redirect_to add_collaborator_path(@clinician, @case)
  end
  
  def add_collaborator
    @clinician= Clinician.find(params[:clinician_id])
    @case = @clinician.cases.find(params[:id])
    exclude = @case.clinicians.each.map {|a| a.id}
    @clinicians = Clinician.where.not(id: exclude)
  end
  
  def index
    @empty_search = false
    @clinician_id = params[:clinician_id].to_i
    @allowed = @clinician_id == current_clinician.id
    @cases = Clinician.find(@clinician_id).cases
    if params[:search].present?
      if params[:search].empty?
        @cases = []
      else
        @cases = Case.search(params[:search])
        if @cases.count == 0
          @empty_search = true
        end
      end
    end
  end
  
  def new
    @clinician_id = params[:clinician_id].to_i
    if clinician_signed_in?
      @clinician = Clinician.find(@clinician_id)
      @case = @clinician.cases.new
    else
      flash[:warning] = "You'll need to login first"
      redirect_to new_clinician_session_path
    end
  end
  
  def edit
    @clinician_id = params[:clinician_id].to_i
    @case_id = params[:id].to_i
    if @clinician_id != current_clinician.id
      flash[:warning] = "You cannot edit cases you are not a part of"
      redirect_to clinician_cases_path(@clinician_id)
    else
      @clinician = Clinician.find(@clinician_id)
      @case = @clinician.cases.find(@case_id)
    end
  end
  
  def create
    @clinician_id = params[:clinician_id].to_i
    @clinician = Clinician.find(@clinician_id)
    @case = @clinician.cases.new(case_params)
    if @case.save
      if params[:documents]
        params[:documents].each do |doc|
           @case.attachments.create(document: doc)
        end
      end
      flash[:success] = "Case was succesfully created"
      redirect_to clinician_case_path(@clinician_id, @case.id)
    else
      render :new
    end
  end
  
  def update
    @clinician_id = params[:clinician_id].to_i
    @case_id = params[:id].to_i
    @clinician = Clinician.find(current_clinician.id)
    @case = @clinician.cases.find(@case_id)
    if @case.update(case_params)
      if params[:documents]
        params[:documents].each do |doc|
           @case.attachments.create(document: doc)
        end
      end
      flash[:success] = "Case was succesfully updated"
      redirect_to clinician_case_path(@clinician_id, @case.id)
    else
      render 'edit'
    end
  end
  
  def show
    @clinician_id = params[:clinician_id].to_i
    @clinician = Clinician.find(@clinician_id)
    @case_id = params[:id].to_i
    @allowed = @clinician_id == current_clinician.id
    @case = @clinician.cases.find(@case_id)
    @attachments = @case.attachments
  end
  
  def destroy
    @clinician_id = params[:clinician_id].to_i
    @clinician = Clinician.find(@clinician_id)
    @case_id = params[:id].to_i
    if @clinician_id != current_clinician.id
      flash[:warning] = "You cannot delete cases you are not a part of"
      redirect_to clinician_cases_path(@clinician_id)
    else
      @case = @clinician.cases.find(@case_id)
      @case.destroy
      flash[:success] = "Case was succesfully deleted"
      redirect_to clinician_cases_path(@clinician_id)
    end
  end
  
  def search

  end
end
