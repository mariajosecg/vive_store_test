# frozen_string_literal: true

# module ErrorHandler
module ErrorHandler
  extend ActiveSupport::Concern

  def render_success
    render json: {
      success: true
    },
    status: 200
  end

  def render_error(errors)
    render json: {
      success: false,
      errors: errors
    },
    status: 422
  end
end
