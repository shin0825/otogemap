class SearchesController < ApplicationController
  def iidxes_result
    @tags = MachineTag.all()
    @checked_machine_tag_ids = params[:search][:machine_tag_ids]
    @prefecture_id = params[:search][:prefecture_id]
    @iidx_machine_id = params[:search][:iidx_machine_id]
    @iidx_monitor_id = params[:search][:iidx_monitor_id]
    @serial_no = params[:search][:serial_no]
    @iidx = Iidx.search(params)
  end

  def amusement_arcades_result
    @tags = ShopTag.all()
    @checked_shop_tag_ids = params[:search][:shop_tag_ids]
    @prefecture_id = params[:search][:prefecture_id]
    @arcade = AmusementArcade.search(params)
  end
end
