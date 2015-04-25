class Api::LinksController < Api::ApplicationController

  before_action :set_link, only: [:destroy]

  def index
    @links = current_user.find_note_or_child_note(params[:note_id]).links
  end

  def create
    @link = Link.new(link_params)
    @link.note_id = params[:note_id]

    unless @link.save
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    head :ok
  end

  private

    def set_link
      @link = current_user.find_note_or_child_note(params[:note_id]).links.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:linked_note_id)
    end

end
