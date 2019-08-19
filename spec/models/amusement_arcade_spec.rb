require 'rails_helper'

RSpec.describe AmusementArcade, type: :model do
  context "値が正常な時" do
    let(:amusement_arcade) { create(:amusement_arcade) }
    it "is valid" do
      expect(amusement_arcade).to be_valid
    end
  end
end
