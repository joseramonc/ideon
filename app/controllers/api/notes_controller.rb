class Api::NotesController < Api::ApplicationController

  before_action :set_note, only: [:show, :update, :destroy]

  def index
    @notes = current_user.notes
  end

  def show
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    unless @note.save
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
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
      @note = current_user.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body, :favorite, :deleted, { tag_ids: [] })
    end

end
