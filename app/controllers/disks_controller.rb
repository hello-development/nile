class DisksController < ApplicationController
	def index
    if admin_signed_in?
      @item = Item.find(params[:item_id])
      @disk = Disk.new
      @disks = @item.disks
    else
      redirect_to items_path and return
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @disk = Disk.new(disk_params)
    @disk.item_id = @item.id
    if @disk.save
      redirect_to item_disks_path, notice: "Disk created successfully"
    else
      @disks = @item.disks
      render :index
    end
  end

  def destroy
    disk = Disk.find_by(item_id: params[:item_id], id: params[:id])
    disk.destroy
    redirect_to item_disks_path, notice: "Disk delete successfully"
  end

  private

    def disk_params
      params.require(:disk).permit(:disk_number, :item_id)
    end


end
