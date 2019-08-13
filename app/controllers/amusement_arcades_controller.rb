class AmusementArcadesController < ApplicationController
  before_action :finding_arcade, only: %i(edit update destroy)

  def index
    @arcade = AmusementArcade.all
  end

  def new
    @arcade = AmusementArcade.new()
  end

  def show
    @arcade = AmusementArcade.includes(:prefecture).find_by(id: params[:id])
    @iidx = @arcade.iidx
    @hash = Gmaps4rails.build_markers(@arcade) do |arcade, marker|
      marker.lat arcade.latitude
      marker.lng arcade.longitude
      marker.infowindow arcade.name
    end
  end

  def edit; end

  def create
    @arcade = AmusementArcade.new(arcade_params)
    if @arcade.save
      redirect_to @arcade, notice: 'created!!'
    else
      render :new
    end
  end

  def update
    if @arcade.update(arcade_params)
      redirect_to @arcade, notice: 'updated!!'
    else
      render :edit
    end
  end

  def destroy
    @arcade.destroy
    redirect_to amusement_arcades_path, notice: 'ゲームセンター情報を削除しました'
  end

  private
    def finding_arcade
      @arcade = AmusementArcade.find_by(id: params[:id])
    end

    def arcade_params
      params.require(:amusement_arcade).permit(
        :name,
        :name_kana,
        :prefecture_id,
        :address
      )
    end
end
