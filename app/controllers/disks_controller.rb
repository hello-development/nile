class DisksController < ApplicationController
	def index
    @item = Item.find params[:item_id]
	  @disk = Disk.new
    @disks = @item.disks
    end

    def create
      @item = Item.find params[:item_id]
      @disk = Disk.new(disk_params)
      @disk.item_id = @item.id
      if @disk.save
      	redirect_to item_disks_path, notice: "Disk created successfully"
      else
        @disks = @item.disks
      	render :index
      end
    end

      private

        def disk_params
          params.require(:disk).permit(:disk_number, :item_id)
        end


end