class NotesController < ApplicationController
  before_action :require_login!

  def create
    note = current_user.notes.new(note_params)
    note.save
    flash[:errors] = note.errors.full_messages

    redirect_to challenge_url(note.challenge_id)
  end

  def destroy
    note = current_user.notes.find(params[:id])
    note.destroy
    redirect_to challenge_url(note.challenge_id)
  end

  private

  def note_params
    params.require(:note).permit(:content, :challenge_id)
  end
  
end