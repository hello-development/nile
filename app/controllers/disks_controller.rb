class DisksController < ApplicationController
	def index
	  @disk = Disk.new
      @disks = Disk.all
    end

    def create
      @disk = Disk.new(disk_params)
      if @disk.save
      	redirect_to item_disks_path, notice: "Disk created successfully"
      else
      	render :index
      end
    end

      private

        def disk_params
          params.require(:disk).permit(:disk_number)
        end


end

