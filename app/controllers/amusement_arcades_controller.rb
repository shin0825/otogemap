class AmusementArcadesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :finding_arcade, only: %i(edit update destroy)

  def index
    @arcade = AmusementArcade.all.order(:prefecture_id, :address)
  end

  def new
    @arcade = AmusementArcade.new()
    @tags = ShopTag.all
  end

  def show
    @arcade = AmusementArcade.includes(:prefecture).find_by(id: params[:id])
    @tags = ShopTag.all
    @iidx = @arcade.iidx.order(:name)
    @hash = Gmaps4rails.build_markers(@arcade) do |arcade, marker|
      marker.lat arcade.latitude
      marker.lng arcade.longitude
      marker.infowindow arcade.name
    end
  end

  def edit
    @tags = ShopTag.all
  end

  def create
    @arcade = AmusementArcade.new(arcade_params)
    if @arcade.save
      redirect_to @arcade, notice: 'created!!'
    else
      render_ajax_error model: @arcade
    end
  end

  def update
    @arcade.shop_tags.clear
    if @arcade.update(arcade_params)
      redirect_to @arcade, notice: 'updated!!'
    else
      render_ajax_error model: @arcade
    end
  end

  def destroy
    @arcade.destroy
    redirect_to amusement_arcades_path, notice: 'ゲームセンター情報を削除しました'
  end

  def shop_tag
    @tag = ShopTag.find_by(name: params[:name])
    @arcades = @tag.amusement_arcades.build
    @arcade  = @tag.amusement_arcades.page(params[:page])
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
        :address,
        :shop_tag_text,
        :homepage_url,
        :twitter_url,
        { shop_tag_ids: [] }
      )
    end
end
