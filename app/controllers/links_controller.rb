class LinksController < ApplicationController
  before_action :set_link, only: [:show, :destroy]
  

  def new
    @link = Link.new
  end

  #POST /link
  def create
    @note = Note.find(params[:note_id])
    params[:link][:linked_note_id].delete('') # remove white element in params # => ['', '1', '3', ... ]
    params[:link][:linked_note_id].each do |id|
      @note.links.create(linked_note_id: id)
    end
    redirect_to note_path(@note)    
  end

  def show
  end

  # UPDATE/ link
  def update
  end

  # DELETE /link
  def destroy
    @note = Note.find(params[:note_id])
    @link = @note.links.find(params[:id])
    @link.destroy
    redirect_to note_path(@note), notice: 'Se eliminó el vínculo'
  end

  private

    def set_link      
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:linked_note_id, :note_id)
    end

   
end
