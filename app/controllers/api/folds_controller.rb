class Api::FoldsController < Api::ApplicationController

  before_action :set_fold, only: [:show, :update, :destroy]

  def index
    @folds = current_user.notes.find(params[:note_id]).folds
  end

  def show
  end

  def create
    @fold = Fold.new(fold_params)
    @fold.note_id = params[:note_id]

    unless @fold.save
      render json: @fold.errors, status: :unprocessable_entity
    end
  end

  def update
    unless @fold.update(fold_params)
      render json: @fold.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @fold.destroy
    head :ok
  end

  private

    def set_fold
      @fold = current_user.notes.find(params[:note_id]).folds.find(params[:id])
    end

    def fold_params
      params.require(:fold).permit(:content)
    end

end
