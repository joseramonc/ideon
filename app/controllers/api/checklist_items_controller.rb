class Api::ChecklistItemsController < Api::ApplicationController

  before_action :set_checklist_item, only: [:show, :update, :destroy]

  def index
    @checklist_items = current_user.find_note_or_child_note(params[:note_id]).checklist_items
  end

  def show
  end

  def create
    @checklist_item = ChecklistItem.new(checklist_item_params)
    @checklist_item.note_id = params[:note_id]

    unless @checklist_item.save
      render json: @checklist_item.errors, status: :unprocessable_entity
    end
  end

  def update
    unless @checklist_item.update(checklist_item_params)
      render json: @checklist_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @checklist_item.destroy
    head :ok
  end

  private

    def set_checklist_item
      @checklist_item = current_user.find_note_or_child_note(params[:note_id]).checklist_items.find(params[:id])
    end

    def checklist_item_params
      params.require(:checklist_item).permit(:description, :checked)
    end
end
