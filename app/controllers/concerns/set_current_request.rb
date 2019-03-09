module SetCurrentRequest
  extend ActiveSupport::Concern

  included do
    before_action :set_current_request_details
  end

  private
    def set_current_request_details
      Current.referrer = request.referrer
      Current.user_agent = request.user_agent
    end
end

