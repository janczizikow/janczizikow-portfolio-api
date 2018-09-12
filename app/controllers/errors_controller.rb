# frozen_string_literal: true

class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :skip_authorization

  def catch_404
    # rubocop:disable Style/RaiseArgs
    raise ActionController::RoutingError.new(params[:path])
    # rubocop:enable Style/RaiseArgs
  end
end
