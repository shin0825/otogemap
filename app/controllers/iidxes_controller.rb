class IidxesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :finding_iidx, only: %i(show edit update destroy)

  def new
    @iidx = Iidx.new()
  end

  def show
    @arcade = AmusementArcade.find(@iidx.amusement_arcade_id)
  end

  def edit; end

  def create
    @iidx = Iidx.new(iidx_params)
    if @iidx.save
      redirect_to @iidx.amusement_arcade, notice: 'created!!'
    else
      render :new
    end
  end

  def update
    if @iidx.update(iidx_params)
      redirect_to @iidx.amusement_arcade, notice: 'updated!!'
    else
      render :edit
    end
  end

  def destroy
    arcade_id = @iidx.amusement_arcade.id
    @iidx.destroy
    redirect_to amusement_arcade_path(arcade_id), notice: 'IIDX筐体方法を削除しました'
  end

  private
    def finding_iidx
      @iidx = Iidx.find_by(id: params[:id])
    end

    def iidx_params
      params.require(:iidx).permit(
        :name,
        :serial_no,
        :spring_weight,
        :switch_weight,
        :cash_price,
        :paseli_price,
        :premium_free_time_from,
        :premium_free_time_to,
        :paseli_availability,
        :amusement_arcade_id
      )
    end
end
