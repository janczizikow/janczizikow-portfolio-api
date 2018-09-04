# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SubmissionsController, type: :controller do
  let(:submission) { build(:submission) }
  let(:new_submission) { create(:submission) }

  describe 'GET #index' do
    it 'returns 401' do
      get :index
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET #show' do
    it 'returns 401' do
      get :show, params: {id: submission}
      expect(response).to have_http_status(401)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, params: {submission: new_submission.attributes}
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET #destroy' do
    it 'returns 401' do
      delete :destroy, params: {id: submission}
      expect(response).to have_http_status(401)
    end
  end
end
