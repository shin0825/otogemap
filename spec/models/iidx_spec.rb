require 'rails_helper'

RSpec.describe Iidx, type: :model do
  context "値が正常な時" do
    let(:iidx) { create(:iidx) }
    it "is valid" do
      expect(iidx).to be_valid
    end
  end

  context "シリアルが12文字より少ない時" do
    let(:iidx) { build(:iidx, serial_no: "A"*6+"0"*5) }
    it "シリアルの文字数エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "シリアルの文字数エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:serial_no]).to include("は12文字で入力してください")
    end
  end

  context "シリアルが12文字より多い時" do
    let(:iidx) { build(:iidx, serial_no: "A"*6+"0"*7) }
    it "シリアルの文字数エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "シリアルの文字数エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:serial_no]).to include("は12文字で入力してください")
    end
  end

  context "シリアルが英字5文字数字7文字の時" do
    let(:iidx) { build(:iidx, serial_no: "A"*5+"0"*7) }
    it "シリアルのフォーマットエラーになること" do
      expect(iidx).to_not be_valid
    end
    it "シリアルのフォーマットエラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:serial_no]).to include("シリアルは半角アルファベット6文字と半角数値6文字となります")
    end
  end

  context "シリアルが英字7文字数字5文字の時" do
    let(:iidx) { build(:iidx, serial_no: "A"*7+"0"*5) }
    it "シリアルのフォーマットエラーになること" do
      expect(iidx).to_not be_valid
    end
    it "シリアルのフォーマットエラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:serial_no]).to include("シリアルは半角アルファベット6文字と半角数値6文字となります")
    end
  end

  context "バネが1より少ない時" do
    let(:iidx) { build(:iidx, spring_weight: 0) }
    it "バネの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "バネの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:spring_weight]).to include("は1以上の値にしてください")
    end
  end

  context "バネが100より大きい時" do
    let(:iidx) { build(:iidx, spring_weight: 101) }
    it "バネの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "バネの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:spring_weight]).to include("は100以下の値にしてください")
    end
  end

  context "スイッチが0.01より少ない時" do
    let(:iidx) { build(:iidx, switch_weight: 0.009) }
    it "スイッチの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "スイッチの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:switch_weight]).to include("は0.01以上の値にしてください")
    end
  end

  context "スイッチが1より大きい時" do
    let(:iidx) { build(:iidx, switch_weight: 1.01) }
    it "スイッチの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "スイッチの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:switch_weight]).to include("は1.0以下の値にしてください")
    end
  end

  context "現金が整数でない時" do
    let(:iidx) { build(:iidx, cash_price: 100.1) }
    it "現金の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "現金の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:cash_price]).to include("は整数で入力してください")
    end
  end

  context "現金が10より少ない時" do
    let(:iidx) { build(:iidx, cash_price: 9) }
    it "現金の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "現金の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:cash_price]).to include("は10以上の値にしてください")
    end
  end

  context "現金が1000より大きい時" do
    let(:iidx) { build(:iidx, cash_price: 1001) }
    it "現金の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "現金の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:cash_price]).to include("は1000以下の値にしてください")
    end
  end

  context "PASELI使用可否がnilである時" do
    let(:iidx) { build(:iidx, paseli_availability: nil) }
    it "PASELI使用可否の未入力エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "PASELI使用可否の未入力エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:paseli_availability]).to include("は一覧にありません")
    end
  end

  context "PASELI使用可否がtrueである時" do
    let(:iidx) { build(:iidx, paseli_availability: true) }
    it "正常となること" do
      expect(iidx).to be_valid
    end
  end

  context "PASELI使用可否がfalseである時" do
    let(:iidx) { build(:iidx, paseli_availability: false) }
    it "正常となること" do
      expect(iidx).to be_valid
    end
  end

  context "PASELIが整数でない時" do
    let(:iidx) { build(:iidx, paseli_price: 100.1) }
    it "PASELIの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "PASELIの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:paseli_price]).to include("は整数で入力してください")
    end
  end

  context "PASELIが10より少ない時" do
    let(:iidx) { build(:iidx, paseli_price: 9) }
    it "PASELIの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "PASELIの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:paseli_price]).to include("は10以上の値にしてください")
    end
  end

  context "PASELIが1000より大きい時" do
    let(:iidx) { build(:iidx, paseli_price: 1001) }
    it "PASELIの数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "PASELIの数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:paseli_price]).to include("は1000以下の値にしてください")
    end
  end

  context "プレミアムフリー最小時間が整数でない時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 10.1) }
    it "プレミアムフリー最小時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最小時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は整数で入力してください")
    end
  end

  context "プレミアムフリー最小時間が10より少ない時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 0) }
    it "プレミアムフリー最小時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最小時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は1以上の値にしてください")
    end
  end

  context "プレミアムフリー最小時間が1000より大きい時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 100) }
    it "プレミアムフリー最小時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最小時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は99以下の値にしてください")
    end
  end

  context "プレミアムフリー最大時間が整数でない時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 10.1) }
    it "プレミアムフリー最大時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最大時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は整数で入力してください")
    end
  end

  context "プレミアムフリー最大時間が10より少ない時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 0) }
    it "プレミアムフリー最大時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最大時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は1以上の値にしてください")
    end
  end

  context "プレミアムフリー最大時間が1000より大きい時" do
    let(:iidx) { build(:iidx, premium_free_time_from: 100) }
    it "プレミアムフリー最大時間の数値エラーになること" do
      expect(iidx).to_not be_valid
    end
    it "プレミアムフリー最大時間の数値エラーメッセージが表示されること" do
      iidx.valid?
      expect(iidx.errors[:premium_free_time_from]).to include("は99以下の値にしてください")
    end
  end
end
