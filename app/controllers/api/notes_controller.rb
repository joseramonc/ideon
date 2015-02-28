class Api::NotesController < Api::ApplicationController

  def index
    @notes = current_user.notes
  end

  def create
    Note.create!()
  end

  def update
    @note = current_user.notes.find(params[:id])

  end

  def destroy
    @note = current_user.notes.find(params[:id])

  end

  private

end
