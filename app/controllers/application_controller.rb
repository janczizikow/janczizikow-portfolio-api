# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  rescue_from ActionController::RoutingError, with: :not_found

  respond_to :json

  before_action :authenticate_user!, unless: :devise_controller?

  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  private

  def not_found(exception)
    logger.error "Routing error occurred for path: #{exception}"
    render json: {status: 404, error: 'Not Found'}, status: :not_found
  end
end
