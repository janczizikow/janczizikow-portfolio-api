# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }
  let(:url) { '/api/v1/auth/login' }
  let(:headers) { {'Accept' => 'application/json', 'Content-Type' => 'application/json'} }

  context 'when params are correct' do
    before do
      post url, headers: Devise::JWT::TestHelpers.auth_headers(headers, user)
    end

    it 'returns 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    pending "figure out how to test token validity #{__FILE__}"
    # it 'returns a valid JWT token' do
    #   # TODO: figure out how to test this
    # end
  end

  context 'when params are incorrect' do
    before do
      post url, params: {email: 'joe@shmoe.com', password: '1234567'}
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end
  end
end
