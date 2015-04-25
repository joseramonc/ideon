class Api::NotesController < Api::ApplicationController

  before_action :set_note, only: [:show, :update, :destroy]

  def index
    @notes = current_user.notes_and_child_notes
  end

  def show
  end

  def create
    if params[:note][:parent_id] == 0
      @note = Note.new(note_params)
    else
      @note = ChildNote.new(note_params)
    end
    @note.user = current_user

    unless @note.save
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    if params[:note][:parent_id] == 0
      @note.type = nil
    else
      @note.type = 'ChildNote'
    end
    unless @note.update(note_params)
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    head :ok
  end

  private

    def set_note
      @note = current_user.find_note_or_child_note(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body, :favorite, :deleted, :position, :parent_id, { tag_ids: [] })
    end

end
