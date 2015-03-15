class Api::TagsController < Api::ApplicationController

  before_action :set_tag, only: [:update, :destroy]

  def index
    @tags = current_user.tags
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user

    unless @tag.save
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    unless @tag.update(tag_params)
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    head :ok
  end

  private

    def set_tag
      @tag = current_user.tags.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
