# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Submissions', type: :request do
  let(:user) { build(:user) }
  let(:url) { '/api/v1/submissions' }
  let(:submission) { build(:submission) }
  let(:new_submission) { create(:submission) }

  pending "figure out how to test submissions with authorization! #{__FILE__}"

  # describe '#index' do
  #   it 'returns 200' do
  #     headers = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}
  #     # This will add a valid token for `user` in the `Authorization` header
  #     auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
  #     get url, headers: auth_headers
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe '#show' do
  #   it 'returns 200' do
  #     get url, params: {id: submission}
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe 'POST /submissions' do
    it 'creates new submission' do
      post url, params: {submission: new_submission.attributes}
      expect(response).to have_http_status(201)
    end
  end

  # describe '#destroy' do
  #   it 'returns 201' do
  #     delete url, params: {id: submission}
  #     expect(response).to have_http_status(201)
  #   end
  # end
end
