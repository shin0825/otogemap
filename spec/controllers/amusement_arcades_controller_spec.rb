require 'rails_helper'

RSpec.describe AmusementArcadesController, type: :controller do
  render_views
  before do
    @iidx = build(:iidx)
  end

  context 'GET #showアクションを実行した時' do
    let(:amusement_arcade) { create(:amusement_arcade) }
    before { get :show, params: { id: amusement_arcade.id }, session: {} }

    it 'レスポンスを返すこと' do
      expect(response).to be_successful
    end

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status "200"
    end

    it '@arcadeの値が正しいこと' do
      expect(assigns(:arcade)).to eq amusement_arcade
    end

    it 'showがレンダリングされること' do
      expect(response).to render_template :show
    end

    it '_iidxがレンダリングされること' do
      expect(response.body).to include('IIDX筐体')
    end

    it '_arcade_searchbarがレンダリングされること' do
      expect(response.body).to include('ゲーセンを検索：')
    end
  end
end
