class SearchesController < ApplicationController
  def iidxes_result
    @tags = MachineTag.all()
    @checked_machine_tag_ids = params[:search][:machine_tag_ids]
    @prefecture_id = params[:search][:prefecture_id]
    @iidx = Iidx.search(params)
  end

  def amusement_arcades_result
    @tags = ShopTag.all()
    @checked_shop_tag_ids = params[:search][:shop_tag_ids]
    @prefecture_id = params[:search][:prefecture_id]
    @arcade = AmusementArcade.search(params)
  end
end
