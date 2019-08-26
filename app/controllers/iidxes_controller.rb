class IidxesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :finding_iidx, only: %i(show edit update destroy)

  def new
    @iidx = Iidx.new()
    @tags = MachineTag.all
    @iidx.amusement_arcade_id = params[:amusement_arcade_id] unless params[:amusement_arcade_id].blank?
  end

  def show
    @arcade = AmusementArcade.find(@iidx.amusement_arcade_id)
    @tags = MachineTag.all
  end

  def edit
    @tags = MachineTag.all
  end

  def create
    @iidx = Iidx.new(iidx_params)
    if @iidx.save
      redirect_to @iidx.amusement_arcade, notice: 'created!!'
    else
      render_ajax_error model: @iidx
    end
  end

  def update
    @iidx.machine_tags.clear
    if @iidx.update(iidx_params)
      redirect_to @iidx.amusement_arcade, notice: 'updated!!'
    else
      render_ajax_error model: @iidx
    end
  end

  def destroy
    arcade_id = @iidx.amusement_arcade.id
    @iidx.destroy
    redirect_to amusement_arcade_path(arcade_id), notice: 'IIDX筐体方法を削除しました'
  end

  def iidxes_machine_tag
    @tag = MachineTag.find_by(name: params[:name])
    @iidxes = @tag.iidxes.build
    @iidx  = @tag.iidxes.page(params[:page])
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
        :spring_is_found_value,
        :switch_weight,
        :switch_is_found_value,
        :cash_price,
        :paseli_price,
        :premium_free_time_from,
        :premium_free_time_to,
        :paseli_availability,
        :amusement_arcade_id,
        :iidx_machine_id,
        :iidx_monitor_id,
        { machine_tag_ids: [] }
      )
    end
end
