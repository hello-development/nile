class DisksController < ApplicationController
	def index
    @item = Item.find params[:item_id]
	  @disk = Disk.new
    @disks = @item.disks
    end

    def create
      @disk = Disk.new(disk_params)
      if @disk.save!
      	redirect_to item_disks_path, notice: "Disk created successfully"
      else
      	render :index
      end
    end

      private

        def disk_params
          params.require(:disk).permit(:disk_number, :item_id)
        end


end