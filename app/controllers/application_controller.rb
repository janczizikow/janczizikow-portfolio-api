# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  respond_to :json

  before_action :authenticate_user!, unless: :devise_controller?
end
