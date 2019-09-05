require 'rails_helper'

RSpec.describe IidxesController, type: :controller do
  render_views

  context 'GET #showアクションを実行した時' do
    let(:iidx) { create(:iidx) }
    before { get :show, params: { id: iidx.id }, session: {} }

    it 'レスポンスを返すこと' do
      expect(response).to be_successful
    end

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status "200"
    end

    it '@iidxの値が正しいこと' do
      expect(assigns(:iidx)).to eq iidx
    end

    it 'showがレンダリングされること' do
      expect(response).to render_template :show
    end

    it '_arcadeがレンダリングされること' do
      expect(response.body).to include('所在地')
    end

    it '_iidx_searchbarがレンダリングされること' do
      expect(response.body).to include('IIDXを検索：')
    end
  end
end
