# frozen_string_literal: true

# module ErrorHandler
module ErrorHandler
  extend ActiveSupport::Concern

  def render_success
    render json: { success: true }, status: 200
  end

  def render_error(error)
    render json: { success: false, errors: error }, status: 422
  end
end
