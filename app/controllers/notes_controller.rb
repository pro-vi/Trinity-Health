class NotesController < ApplicationController
  def note_params
    params.require(:note).permit(:subject, :note_text)
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])  
    @case = Case.find_by(params[:case_id])
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      this_case = @note.case
      redirect_to case_path(this_case)
    else
      flash[:error] = "Please fill in note"
      redirect_to new_case_note_path
    end 
  end

  def update
    @note = Note.new(note_params)
    if @note.save
      this_case = @note.case
      redirect_to case_path(this_case)
    else
      flash[:error] = "Please fill in note"
      redirect_to edit_case_note_path
    end 
  end

  def index
    @case = Case.find_by(params[:case_id]) 
    @notes = Note.where(:case_id => params[:case_id]) 
  end 
end
