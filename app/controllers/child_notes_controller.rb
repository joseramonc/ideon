class ChildNotesController < ApplicationController
  before_action :set_child_note, only: [:show, :edit, :update, :destroy]
  before_action :set_notes, only: [:new, :create, :edit, :update]
  # GET /child_notes
  # def index
  #   @child_notes = ChildNote.all
  # end

  # GET /child_notes/1
  def show
  end

  # GET /child_notes/new
  def new
    @child_note = ChildNote.new
  end

  # GET /child_notes/1/edit
  def edit
  end

  # POST /child_notes
  def create
    @child_note = ChildNote.new(child_note_params)

    if @child_note.save
      # @child_note.reload
      redirect_to @child_note.note, notice: 'Se creo la nota.'
    else
      render :new
    end
  end

  # PATCH/PUT /child_notes/1
  def update
    if @child_note.update(child_note_params)
      redirect_to @child_note.note, notice: 'La nota se actualizo.'
    else
      render :edit
    end
  end

  # DELETE /child_notes/1
  def destroy
    note = @child_note.note
    @child_note.destroy
    redirect_to note, notice: 'Se eliminó la nota/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_note
      @child_note = ChildNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_note_params
      params.require(:child_note).permit(:title, :body, :note_id)
    end

    def set_notes
      @notes = current_user.notes
    end
end
