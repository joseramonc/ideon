class FoldsController < ApplicationController
  before_action :set_fold, only: [:show, :update, :destroy]

  def create
    @fold = Fold.new(fold_params)
    @fold.note_id = params[:note_id]

    if @fold.save
      redirect_to @fold.note
    else
      render 'error'
    end
  end

  def update
    if @fold.update(fold_params)
      render json: { status: :ok }.to_json
    else
      render 'error'
    end
  end

  def destroy
    @fold.destroy
    redirect_to @note
  end

  private

    def set_fold
      @note = current_user.notes.find(params[:note_id])
      @fold = @note.folds.find(params[:id])
    end

    def fold_params
      params.require(:fold).permit(:content)
    end
end
