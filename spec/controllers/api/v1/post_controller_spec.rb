# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PostController, type: :controller do
  describe 'POST /api/v1/post' do
    let(:params) { { login: login, title: title, description: title, ip: ip } }
    let(:expected_response_body) { { author_login: login, title: title, description: title } }
    let(:login) { 'login_test' }
    let(:title) { 'title_test' }
    let(:description) { 'description_test' }
    let(:ip) { '0.0.0.0' }

    context 'with valid params' do
      it 'response with 201' do
        post :create, params: params.as_json, format: :json

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body, symbolize_names: true)).to include(expected_response_body)
      end
    end

    context 'with invalid params' do
      let(:ip) { 'invalid' }
      let(:expected_response_body) { :ip }

      it 'response with 422' do
        post :create, params: params.as_json, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body, symbolize_names: true)).to include(expected_response_body)
      end
    end
  end
end
