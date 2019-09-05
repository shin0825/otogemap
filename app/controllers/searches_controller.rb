class SearchesController < ApplicationController
  def iidxes_result
    @tags = MachineTag.all
    if params[:search].present?
      @checked_machine_tag_ids = params[:search][:machine_tag_ids]
      @prefecture_id = params[:search][:prefecture_id]
      @iidx_machine_id = params[:search][:iidx_machine_id]
      @iidx_monitor_id = params[:search][:iidx_monitor_id]
      @iidx_version_id = params[:search][:iidx_version_id]
      @serial_no = params[:search][:serial_no]
      @iidx = Iidx.search(params)
    else
      @iidx = Iidx.all
    end
    @iidx = @iidx.paginate(page: params[:page], per_page: 5)
  end

  def amusement_arcades_result
    @tags = ShopTag.all
    if params[:search].present?
      @checked_shop_tag_ids = params[:search][:shop_tag_ids]
      @prefecture_id = params[:search][:prefecture_id]
      @key_words = params[:search][:key_words]
      @arcade = AmusementArcade.search(params)
    else
      @arcade = AmusementArcade.all
    end
    @arcade = @arcade.paginate(page: params[:page], per_page: 5)
  end
end
