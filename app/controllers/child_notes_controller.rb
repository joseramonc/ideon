class ChildNotesController < ApplicationController
  before_action :set_child_note, only: [:show, :edit, :update, :destroy]
  before_action :set_notes_and_tags, only: [:new, :create, :edit, :update]
  # GET /child_notes
  # def index
  #   @child_notes = ChildNote.all
  # end

  # GET /child_notes/1
  def show
  end

  # GET /child_notes/new
  def new
    @note = ChildNote.new
  end

  # GET /child_notes/1/edit
  def edit
  end

  # POST /child_notes
  def create
    @note = ChildNote.new(child_note_params)

    if @note.save
      # @note.reload
      redirect_to @note.parent, notice: 'Se creo la nota.'
    else
      render :new
    end
  end

  # PATCH/PUT /child_notes/1
  def update
    if @note.update(child_note_params)
      redirect_to @note.parent, notice: 'La nota se actualizo.'
    else
      render :edit
    end
  end

  # DELETE /child_notes/1
  def destroy
    note = @note.note
    @note.destroy
    redirect_to note, notice: 'Se eliminó la nota/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_note
      @note = ChildNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_note_params
      params.require(:child_note).permit(:title, :body, :parent_id)
    end

    def set_notes_and_tags
      @notes = current_user.notes
      @tags = current_user.tags
    end
end
