require 'rails_helper'

RSpec.describe AmusementArcade, type: :model do
  before do
    @prefecture = create(:prefecture)
  end

  describe 'Relation' do
    let(:amusement_arcades) { create(:amusement_arcade, prefecture: @prefecture) }
    it 'has many prefecture' do
      expect(@prefecture.amusement_arcades).to match_array amusement_arcades
    end
  end

  context "値が正常な時" do
    let(:amusement_arcade) { build(:amusement_arcade) }
    it "is valid" do
      expect(amusement_arcade).to be_valid
    end
  end

  context "名前が入力されていない時" do
    let(:amusement_arcade) { build(:amusement_arcade, name: nil) }
    it "名前の未入力エラーとなること" do
      expect(amusement_arcade).to_not be_valid
    end
    it "名前の未入力エラーメッセージが表示されること" do
      amusement_arcade.valid?
      expect(amusement_arcade.errors[:name]).to include("を入力してください")
    end
  end

  context "名前（かな）が入力されていない時" do
    let(:amusement_arcade) { build(:amusement_arcade, name_kana: nil) }
    it "名前（かな）の未入力エラーとなること" do
      expect(amusement_arcade).to_not be_valid
    end
    it "名前（かな）の未入力エラーメッセージが表示されること" do
      amusement_arcade.valid?
      expect(amusement_arcade.errors[:name_kana]).to include("を入力してください")
    end
  end

  context "住所が入力されていない時" do
    let(:amusement_arcade) { build(:amusement_arcade, address: nil) }
    it "住所の未入力エラーとなること" do
      expect(amusement_arcade).to_not be_valid
    end
    it "住所の未入力エラーメッセージが表示されること" do
      amusement_arcade.valid?
      expect(amusement_arcade.errors[:address]).to include("を入力してください")
    end
  end

  context "ホームページURLが入力されていない時" do
    let(:amusement_arcade) { build(:amusement_arcade, homepage_url: '') }
    it "ホームページURLの未入力エラーとならないこと" do
      expect(amusement_arcade).to be_valid
    end
  end

  context "ホームページURLが不正な時" do
    let(:amusement_arcade) { build(:amusement_arcade, homepage_url: 'hogehoge') }
    it "ホームページURLのフォーマットエラーになること" do
      expect(amusement_arcade).to_not be_valid
    end
    it "Twitter URLのフォーマットエラーメッセージが表示されること" do
      amusement_arcade.valid?
      expect(amusement_arcade.errors[:homepage_url]).to include("は不正な値です")
    end
  end

  context "Twitter URLが入力されていない時" do
    let(:amusement_arcade) { build(:amusement_arcade, twitter_url: '') }
    it "Twitter URLの未入力エラーとならないこと" do
      expect(amusement_arcade).to be_valid
    end
  end

  context "Twitter URLが不正な時" do
    let(:amusement_arcade) { build(:amusement_arcade, twitter_url: 'hogehoge') }
    it "Twitter URLのフォーマットエラーになること" do
      expect(amusement_arcade).to_not be_valid
    end
    it "Twitter URLのフォーマットエラーメッセージが表示されること" do
      amusement_arcade.valid?
      expect(amusement_arcade.errors[:twitter_url]).to include("は不正な値です")
    end
  end

end
