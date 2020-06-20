# frozen_string_literal: true

# module Admin
module Admin
  # class DashboardController
  class DashboardController < BaseController
    def index
      @all_requests = Request.all.size
      @success_requests = Request.success.size 
      @failed_requests = Request.failed.size
    end
  end
end
