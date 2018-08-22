class SongsController < ApplicationController
  def index
  	@disk = Disk.find(params[:disk_id])
  	@song = Song.new
  	@songs = @disk.songs
  end

  def create
  	@disk = Disk.find(params[:disk_id])
  	@song = Song.new(song_params)
  	@song.disk_id = @disk.id
  	if @song.save
  	  redirect_to item_disk_songs_path, notice: "Song created successfully"
  	else
      @item = Item.find(params[:item_id])
  	  @songs = @disk.songs
  	  render :index
  	end
  end

  def edit
  	@disk = Disk.find(params[:disk_id])
  	@song = Song.find(params[:id])
  end


  def update
  	@song = Song.find(params[:id])
  	if @song.update(song_params)
  	  redirect_to item_disk_songs_path, notice: "Song updated successfully"
  	else
  	  @item = Item.find(params[:item_id])
  	  @disk = Disk.find(params[:disk_id])
  	  render :edit
    end
  end

  def destroy
  	song = Song.find_by(disk_id: params[:disk_id], id: params[:id])
    song.destroy
  	redirect_to item_disk_songs_path, notice: "Song delete successfully"
  end

  private
    def song_params
      params.require(:song).permit(:song_order, :song_name, :disk_id)
    end
end
