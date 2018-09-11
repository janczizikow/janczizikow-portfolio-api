# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :controller do
  let(:project) { build(:project) }
  let(:new_project) { create(:project) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: {id: project.friendly_id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http unauthorized' do
      post :create, params: {project: new_project.attributes}
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH #update' do
    it 'returns http unauthorized' do
      patch :update, params: {id: project, project: {name: 'New name'}}
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http unauthorized' do
      delete :destroy, params: {id: project}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
