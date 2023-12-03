class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(err)
    render json: { error: err.record.errors }, status: :unprocessable_entity
  end
end
