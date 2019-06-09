require "rails_helper"

RSpec.describe Api::V1::SearchPostController, :type => :controller do
  describe 'GET /api/v1/top_posts/' do
    let(:params) {  { top_count: top_count } }
    let(:expected_response_body) { {title: "title_factory", description: "description_factory"} }
    let(:top_count) { 1 }
    let!(:post_obj) { FactoryBot.create(:post, :with_post_statistic) }

    context 'with valid params' do
      it "response with 200" do
        get :top_posts, params: params.as_json, format: :json

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body, symbolize_names: true)).to include(expected_response_body)
      end
    end

    context 'with invalid params' do
      let(:top_count) { 'invalid' }
      let(:expected_response_body) { {error: {top_count: "invalid"}} }

      it "response with 422" do
        get :top_posts, params: params.as_json, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body, symbolize_names: true)).to include(expected_response_body)
      end
    end
  end

  describe 'GET /api/v1/uniq_ip_posters' do
    let(:expected_response_body) { {"141.202.126.126"=>["John", "John"]} }

    before do
      2.times { FactoryBot.create(:user_ip) }
    end

    it "response with 200" do
      get :uniq_ip_posters, format: :json

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include(expected_response_body)
    end
  end
end
