class Api::AssetsController < Api::ApplicationController

  before_action :set_asset, only: [:show, :destroy]

  def index
    @assets = current_user.notes.find(params[:note_id]).assets
  end

  def show
    send_file @asset.file.path
  end

  def create
    process_file
    @asset = Asset.new(asset_params)
    @asset.note_id = params[:note_id]

    unless @asset.save
      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @asset.destroy
    head :ok
  end

  private
    def process_file
      if params[:asset] && params[:asset][:file]
	data = StringIO.new(Base64.decode64(params[:asset][:file][:data]))
	data.class.class_eval { attr_accessor :original_filename, :content_type }
	data.original_filename = params[:asset][:file][:filename]
	data.content_type = params[:asset][:file][:content_type]
	params[:asset][:file] = data
      end
    end

    def set_asset
      @asset = current_user.notes.find(params[:note_id]).assets.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:file)
    end

end
