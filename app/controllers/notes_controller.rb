class NotesController < ApplicationController
  before_action :set_note, only: [
                            :show,
                            :toggle_favorite,
                            :edit,
                            :update,
                            :destroy
                          ]

  # GET /notes
  def index
    @notes = current_user.notes
  end

  # GET /notes/favorites
  def favorites
    @notes = current_user.favorite_notes
    render 'index'
  end

  # GET /notes/1
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end


  # PUT /notes/1/toggle_favorite
  def toggle_favorite
    @note.toggle!(:favorite)
    respond_to do |format|
      format.html { redirect_to @note, notice: 'Note was successfully updated.' }
      format.js { render }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body, :favorite, :status)
    end
end
