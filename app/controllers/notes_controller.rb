class NotesController < ApplicationController
  def note_params
    params.require(:note).permit(:subject, :note_text)
  end

  def new
    @case_id = params[:case_id].to_i
    @clinician_id = params[:clinician_id].to_i
    if @clinician_id != current_clinician.id
      flash[:warning] = "You cannot create notes for cases you are not a part of"
      redirect_to clinician_case_notes_path(@clinician_id, @case_id)
    else
      @clinician = Clinician.find(params[:clinician_id])
      @case = @clinician.cases.find(params[:case_id])
      @note = @case.notes.new
    end
  end

  def edit
    @clinician_id = params[:clinician_id].to_i
    @case_id = params[:case_id].to_i
    if @clinician_id != current_clinician.id
      flash[:warning] = "You cannot edit notes for cases you are not a part of"
      redirect_to clinician_case_notes_path(@clinician_id, @case_id)
    else
      @clinician = Clinician.find(@clinician_id)
      @case = @clinician.cases.find(@case_id)
      @note = @case.notes.find(params[:id])  
    end
  end

  def create
    case_id = params[:case_id]
    clinician_id = params[:clinician_id]
    @clinician = Clinician.find(clinician_id)
    @case = @clinician.cases.find(case_id)
    @note = @case.notes.new(note_params)
    if @note.save
      flash[:success] = "Note was created successfully"
      redirect_to clinician_case_notes_path(clinician_id, case_id)
    else
      flash[:error] = "Please fill in note"
      redirect_to new_clinician_case_note_path(clinician_id, case_id)
    end 
  end

  def update
    case_id = params[:case_id]
    clinician_id = params[:clinician_id]
    note_id = params[:id]
    @clinician = Clinician.find(clinician_id)
    @case = @clinician.cases.find(case_id)
    @note = @case.notes.find(note_id)
    if @note.update(note_params)
      flash[:success] = "Note edit was successful"
      redirect_to clinician_case_notes_path(clinician_id, case_id)
    else
      flash[:error] = "Fields cannot be blank"
      redirect_to edit_clinician_case_note_path(clinician_id, case_id, note_id)
    end 
  end

  def index
    @clinician = Clinician.find(params[:clinician_id])
    @case = @clinician.cases.find(params[:case_id]) 
    @notes = @case.notes
  end 
  
  def destroy
    @clinician_id = params[:clinician_id].to_i
    @clinician = Clinician.find(@clinician_id)
    @case_id = params[:case_id].to_i
    if @clinician_id != current_clinician.id
      flash[:warning] = "You cannot delete notes for cases you are not a part of"
      redirect_to clinician_cases_path(@clinician_id)
    else
      @case = @clinician.cases.find(@case_id)
      @note = @case.notes.find(params[:id])
      @note.destroy
      flash[:success] = "Note was succesfully deleted"
      redirect_to clinician_case_notes_path(@clinician_id, @case_id)
    end
  end
end
