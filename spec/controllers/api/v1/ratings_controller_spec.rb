require "rails_helper"

RSpec.describe Api::V1::RatingsController, :type => :controller do
  describe 'POST api/v1/post/:post_id/rating' do
    let(:params) {  { grade: grade, post_id: post_obj.id } }
    let(:expected_response_body) { { average_grade: grade.to_f } }
    let(:grade) { "3" }
    let(:post_obj) { FactoryBot.create(:post) }

    context 'with valid params' do
      it "response with 201" do
        post :create, params: params.as_json, :format => :json

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body, :symbolize_names => true)).to include(expected_response_body)
      end
    end

    context 'with invalid params' do
      let(:grade) { '6' }
      let(:expected_response_body) { :grade }

      it "response with 422" do
        post :create, { params: params.as_json, :format => :json }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body, :symbolize_names => true)).to include(expected_response_body)
      end
    end
  end
end
