class ChecklistItemsController < ApplicationController
	#GET /checklist_item
	def index
	end

	#GET /notes/checklist_item
	def checked
		@checklist_item = current_user.checked
		render 'index'
	end
    
    #GET /checklist_item/1
	def show
	end

	#GET /checklist_item/new
	def new
		#@checklist_item = ChecklistItem.new(note_id: params[:note_id])
		@checklist_item = ChecklistItem.new
	end

	#GET /checklist_item/1/edit
	def edit
	end

	#POST /checklist_item
	def create
		@note = Note.find(params[:note_id])
		@checklist_item = @note.checklist_items.create(checklist_item_params)
		redirect_to note_path(@note)
	end

	# PATCH/PUT /checklist_item/1
	def update
	end

	# DELETE /checklist_item/1
	def destroy
		@note = Note.find(params[:note_id])
		@checklist_item = @note.checklist_items.find(params[:id])
		@checklist_item.destroy
		redirect_to note_path(@note), notice: 'Item was successfully destroyed.'
	end

	# PUT /checklist_item/1/toggle_checked
	def toggle_checked
		@checklist_item.toggle!(:checked)
		respond_to do |format|
			format.html { redirect_to checklist_item, notice: 'Item was successfully updated.'}
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_checklist_item
			@checklist_item = ChecklistItem.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def checklist_item_params
			params.require(:checklist_item).permit(
				:description,
				:checked
				)
		end

end
