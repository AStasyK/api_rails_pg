class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActionController::RoutingError, with: :error_occurred

  protected
  def record_not_found
    render json: { status: 404 }
  end
  def error_occurred(exception)
    render json: {error: exception.message}.to_json, status: 500
    return
  end
end
