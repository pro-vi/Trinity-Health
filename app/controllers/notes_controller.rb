class NotesController < ApplicationController
  def note_params
    params.require(:note).permit(:subject, :note_text)
  end

  def new
    puts "HEEEE"
    @case = Case.find(params[:case_id])
    @note = @case.notes.new
  end

  def edit
    @note = Note.find(params[:id])  
    @case = Case.find(params[:case_id])
  end

  def create
    puts "CREATE"
    @case = Case.find(params[:case_id])
    @note = @case.notes.new(note_params)
    if @note.save
      flash[:success] = "Note was created successfully"
      case_id = params[:case_id]
      redirect_to case_notes_path(case_id)
    else
      flash[:error] = "Please fill in note"
      redirect_to new_case_note_path
    end 
  end

  def update
    @case = Case.find(params[:case_id])
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:success] = "Note edit was successful"
      case_id = params[:case_id]
      redirect_to case_notes_path(case_id)
    else
      flash[:error] = "Fields cannot be blank"
      redirect_to edit_case_note_path
    end 
  end

  def index
    @case = Case.find(params[:case_id]) 
    @notes = Note.where(:case_id => params[:case_id]) 
  end 
end
