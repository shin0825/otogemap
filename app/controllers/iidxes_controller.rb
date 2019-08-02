class IidxesController < ApplicationController
  before_action :finding_iidx, only: %i(show edit update destroy)

  def new
    @iidx = Iidx.new()
  end

  def show; end

  def edit; end

  def create
    @iidx = Iidx.new(iidx_params)
    if @iidx.save
      redirect_to @iidx, notice: 'yattaze!!'
    else
      render :new
    end
  end

  def update
    if @iidx.update(iidx_params)
      redirect_to @iidx, notice: 'greatness!!'
    else
      render :edit
    end
  end

  def destroy
    @iidx.destroy
    redirect_to iidxes_path, notice: 'IIDX筐体方法を削除しました'
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
        :paseli_availability
      )
    end
end
