class SearchesController < ApplicationController
  def iidxes_result
  end

  def amusement_arcades_result
    @tags = ShopTag.all()
    @checked_shop_tag_ids = params[:search][:shop_tag_ids]
    @arcade = AmusementArcade.search(params)
  end
end
