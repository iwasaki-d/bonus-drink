require File.expand_path(File.dirname(__FILE__) + '/../bonus_drink')

describe BonusDrink do
  specify  { expect(BonusDrink.total_count_for(0)).to eq 0 }

  context "交換なし" do
    it "1本購入" do
      expect(BonusDrink.total_count_for(1)).to eq 1
    end

    it "交換されない最大数、2本購入" do
      expect(BonusDrink.total_count_for(2)).to eq 2
    end
  end

  context "交換あり" do
    it "交換される最小本数、3本" do
      expect(BonusDrink.total_count_for(3)).to eq 4
    end

    it "1桁最大本数、9本" do
      expect(BonusDrink.total_count_for(9)).to eq 13
    end

    it "11本" do
      expect(BonusDrink.total_count_for(11)).to eq 16
    end

    it "2桁最大本数、99本" do
      expect(BonusDrink.total_count_for(99)).to eq 148
    end

    it "速度、メモリチェック、100000000本" do
      expect(BonusDrink.total_count_for(100000000)).to be >  100000000
    end

  end

  context "異常系" do

    it "マイナス本数" do
      expect(BonusDrink.total_count_for(-1)).to eq -1
    end

  end


end