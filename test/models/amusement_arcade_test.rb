require 'test_helper'

class AmusementArcadeTest < ActiveSupport::TestCase
  def setup
    @prefecture = prefectures(:aichi)
    @amusement_arcade = @prefecture.amusement_arcades.build(
      name: "わたしのゲームセンター",
      name_kana: "ワタシノゲームセンター",
      address: "愛知県名古屋市中川区",
      latitude: 35.1405944,
      longitude: 136.8534181,
    )
  end

  test "should be valid" do
    assert @amusement_arcade.valid?
  end

  test "prefecture id should be present" do
    @amusement_arcade.prefecture_id = nil
    assert_not @amusement_arcade.valid?
  end
end
