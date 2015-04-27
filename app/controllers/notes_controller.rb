class NotesController < ApplicationController
  before_action :set_note, only: [
                            :show,
                            :toggle_favorite,
                            :edit,
                            :update,
                            :destroy,
                            :toggle_deleted
                          ]
  before_action :set_tags, only: [:index, :favorites, :new, :create, :edit, :update, :deleted]

  # GET /notes
  def index
    @notes = current_user.notes.where(deleted: false)
    filter_by_tag(params[:tag])
    @notes = @notes.search(params[:search])
  end

  # GET /notes/favorites
  def favorites
    @notes = current_user.favorite_notes
    filter_by_tag(params[:tag])
    render 'index'
  end

  #GET /notes/deleted
  def deleted
    @notes = current_user.deleted_notes
    filter_by_tag(params[:tag])
    render 'index'
  end


  # GET /notes/1
  def show
    @notes = current_user.notes.where.not(deleted: true, id: @note.id)
  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.assets.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
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

  # PUT /notes/1/toggle_deleted
  def toggle_deleted
    @note.toggle!(:deleted)
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully updated.' }
      format.js { render }
    end
  end

  def move_to_position
    note = Note.find(params[:id])
    note.move_to_position(params[:position].to_i)
    render json: { status: :ok }
  end

  def delete_asset
    @note = Note.find(params[:id])
    @note.assets.find_by_id(params[:asset_id]).destroy
    redirect_to @note, notice: 'Note was successfully updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(
        { tag_ids: [] },
        :title,
        :body,
        :favorite,
        :status,
        :deleted,
        { assets_attributes: [:id, :_destroy, :file] }
      )
    end

    def set_tags
      @tags = current_user.tags
    end

    def filter_by_tag(selected_tag)
      if selected_tag.present? && selected_tag.to_i > 0
        @notes = current_user.notes.joins(:tags).where('tags.id = ?', selected_tag.to_i)
      end
    end
end
